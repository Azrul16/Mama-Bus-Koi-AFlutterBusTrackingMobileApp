import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/map/open_map.dart';
import '../../../../core/utils/geo_geometry.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../buses/domain/entities/bus.dart';
import '../../../buses/domain/repositories/bus_repository.dart';
import '../../../buses/presentation/bloc/buses_bloc.dart';
import '../../../routes/domain/entities/route.dart';
import '../../../routes/presentation/bloc/routes_cubit.dart';
import '../../../schedules/domain/entities/schedule.dart';
import '../../../schedules/presentation/bloc/schedules_cubit.dart';
import '../../../referrals/domain/entities/referral_claim.dart';
import '../../../referrals/domain/repositories/referral_repository.dart';
import '../../../wallet/domain/repositories/wallet_repository.dart';
import '../../../tracking/data/debug_gps_simulator.dart';
import '../../../../core/location/foreground_location_service.dart';
import '../../../../core/permissions/location_permission_service.dart';
import '../../../tracking/domain/entities/contribution_summary.dart';
import '../../../tracking/domain/repositories/contribution_reward_repository.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Admin Dashboard'),
      actions: [
        IconButton(
          onPressed: () =>
              context.read<AuthBloc>().add(const AuthSignOutRequested()),
          icon: const Icon(Icons.logout),
        ),
      ],
    ),
    body: GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 4 : 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _AdminTile(
          'Buses',
          Icons.directions_bus,
          () => _open(context, const AdminBusesPage()),
        ),
        _AdminTile(
          'Routes',
          Icons.alt_route,
          () => _open(context, const AdminRoutesPage()),
        ),
        _AdminTile(
          'Schedules',
          Icons.calendar_month,
          () => _open(context, const AdminSchedulesPage()),
        ),
        _AdminTile(
          'Live monitor',
          Icons.location_searching,
          () => _open(context, const AdminLiveMonitorPage()),
        ),
        _AdminTile(
          'Referrals',
          Icons.how_to_reg,
          () => _open(context, const AdminReferralPage()),
        ),
        _AdminTile(
          'Test tokens',
          Icons.toll,
          () => _open(context, const AdminTokenGrantPage()),
        ),
        _AdminTile(
          'Contributions',
          Icons.volunteer_activism,
          () => _open(context, const AdminContributionRewardsPage()),
        ),
        if (kDebugMode)
          _AdminTile(
            'GPS simulator',
            Icons.science,
            () => _open(context, const DebugGpsSimulatorPage()),
          ),
      ],
    ),
  );
  void _open(BuildContext context, Widget page) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}

class _AdminTile extends StatelessWidget {
  const _AdminTile(this.label, this.icon, this.onTap);
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 38),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    ),
  );
}

class AdminBusesPage extends StatelessWidget {
  const AdminBusesPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Manage buses')),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () => _edit(context),
      icon: const Icon(Icons.add),
      label: const Text('Bus'),
    ),
    body: BlocBuilder<BusesBloc, BusesState>(
      builder: (context, state) => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.buses.length,
        itemBuilder: (_, index) {
          final bus = state.buses[index].bus;
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.directions_bus)),
              title: Text(bus.name),
              subtitle: Text(bus.busNumber),
              onTap: () => _edit(context, bus),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'deactivate') {
                    context.read<BusRepository>().deactivateBus(
                      bus.institutionId,
                      bus.id,
                    );
                  }
                  if (value == 'delete') {
                    context.read<BusRepository>().deleteBus(
                      bus.institutionId,
                      bus.id,
                    );
                  }
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 'deactivate', child: Text('Deactivate')),
                  PopupMenuItem(value: 'delete', child: Text('Delete safely')),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
  Future<void> _edit(BuildContext context, [Bus? bus]) async {
    final institution = context.read<AuthBloc>().state.user!.institutionId!;
    final name = TextEditingController(text: bus?.name),
        number = TextEditingController(text: bus?.busNumber),
        plate = TextEditingController(text: bus?.plateNumber),
        capacity = TextEditingController(text: bus?.capacity?.toString());
    final save = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(bus == null ? 'Create bus' : 'Edit bus'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: number,
                decoration: const InputDecoration(labelText: 'Bus number'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: plate,
                decoration: const InputDecoration(labelText: 'Plate number'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: capacity,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Capacity'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (save == true && name.text.trim().isNotEmpty && context.mounted) {
      await context.read<BusRepository>().saveBus(
        Bus(
          id: bus?.id ?? const Uuid().v4(),
          institutionId: institution,
          name: name.text.trim(),
          busNumber: number.text.trim(),
          plateNumber: plate.text.trim().isEmpty ? null : plate.text.trim(),
          capacity: int.tryParse(capacity.text),
          colorValue: bus?.colorValue ?? 0xFF087A5B,
        ),
      );
    }
    name.dispose();
    number.dispose();
    plate.dispose();
    capacity.dispose();
  }
}

class AdminRoutesPage extends StatelessWidget {
  const AdminRoutesPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Manage routes')),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const RouteEditorPage()),
      ),
      icon: const Icon(Icons.add_road),
      label: const Text('Route'),
    ),
    body: BlocBuilder<RoutesCubit, List<BusRoute>>(
      builder: (context, routes) => ListView(
        padding: const EdgeInsets.all(16),
        children: routes
            .map(
              (route) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.alt_route),
                    title: Text(route.name),
                    subtitle: Text(
                      '${route.startName} ↔ ${route.endName} · ${(route.distanceMeters / 1000).toStringAsFixed(1)} km',
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RouteEditorPage(existing: route),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.visibility_off_outlined),
                      onPressed: () =>
                          context.read<RoutesCubit>().deactivate(route.id),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ),
  );
}

class RouteEditorPage extends StatefulWidget {
  const RouteEditorPage({super.key, this.existing});
  final BusRoute? existing;
  @override
  State<RouteEditorPage> createState() => _RouteEditorPageState();
}

class _RouteEditorPageState extends State<RouteEditorPage> {
  late final name = TextEditingController(text: widget.existing?.name),
      start = TextEditingController(text: widget.existing?.startName),
      end = TextEditingController(text: widget.existing?.endName);
  late List<GeoPoint> points = [...?widget.existing?.points];
  late List<BusStop> stops = [...?widget.existing?.stops];
  StreamSubscription? recording;
  ForegroundLocationService? locationService;
  bool get isRecording => recording != null;
  BusRoute get preview => BusRoute(
    id: widget.existing?.id ?? 'preview',
    institutionId: context.read<AuthBloc>().state.user!.institutionId!,
    name: name.text,
    startName: start.text,
    endName: end.text,
    distanceMeters: GeoGeometry.polylineLength(points).round(),
    points: points,
    stops: stops,
  );
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.existing == null ? 'Create route' : 'Edit route'),
      actions: [TextButton(onPressed: _save, child: const Text('SAVE'))],
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(labelText: 'Route name'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: start,
                  decoration: const InputDecoration(labelText: 'Start'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: end,
                  decoration: const InputDecoration(labelText: 'End'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: OpenMap(
            route: preview,
            onTap: (point) => setState(() => points.add(point)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Wrap(
            spacing: 8,
            children: [
              OutlinedButton.icon(
                onPressed: points.isEmpty
                    ? null
                    : () => setState(() => points.removeLast()),
                icon: const Icon(Icons.undo),
                label: const Text('Undo'),
              ),
              OutlinedButton.icon(
                onPressed: points.isEmpty ? null : () => setState(points.clear),
                icon: const Icon(Icons.clear),
                label: const Text('Clear'),
              ),
              OutlinedButton.icon(
                onPressed: points.isEmpty ? null : _addStop,
                icon: const Icon(Icons.add_location_alt),
                label: Text('Stop (${stops.length})'),
              ),
              FilledButton.icon(
                onPressed: _toggleRecord,
                icon: Icon(
                  isRecording ? Icons.stop : Icons.fiber_manual_record,
                ),
                label: Text(
                  isRecording ? 'Stop recording' : 'Record actual route',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  Future<void> _toggleRecord() async {
    if (isRecording) {
      await recording?.cancel();
      recording = null;
      await locationService?.stop();
      setState(() => points = GeoGeometry.simplify(points, 12));
      return;
    }
    final readiness = await context
        .read<LocationPermissionService>()
        .ensureContributorPermission();
    if (readiness != LocationReadiness.ready || !mounted) return;
    locationService = context.read<ForegroundLocationService>();
    recording = locationService!.samples.listen((sample) {
      if (sample.accuracyMeters <= 60 && mounted) {
        setState(() => points.add(GeoPoint(sample.latitude, sample.longitude)));
      }
    });
    await locationService!.start('Route recording');
    setState(() {});
  }

  Future<void> _addStop() async {
    final value = await showDialog<String>(
      context: context,
      builder: (_) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Stop name'),
          content: TextField(controller: controller, autofocus: true),
          actions: [
            FilledButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
    if (value?.trim().isNotEmpty == true) {
      setState(
        () => stops.add(
          BusStop(
            id: const Uuid().v4(),
            name: value!.trim(),
            position: points.last,
            order: stops.length,
          ),
        ),
      );
    }
  }

  Future<void> _save() async {
    if (points.length < 2 || name.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Add a name and at least two route points.'),
        ),
      );
      return;
    }
    final route = preview;
    await context.read<RoutesCubit>().save(
      BusRoute(
        id: widget.existing?.id ?? const Uuid().v4(),
        institutionId: route.institutionId,
        name: route.name,
        startName: route.startName,
        endName: route.endName,
        distanceMeters: route.distanceMeters,
        points: route.points,
        stops: route.stops,
      ),
    );
    if (mounted) Navigator.pop(context);
  }

  @override
  void dispose() {
    recording?.cancel();
    locationService?.stop();
    name.dispose();
    start.dispose();
    end.dispose();
    super.dispose();
  }
}

class AdminSchedulesPage extends StatelessWidget {
  const AdminSchedulesPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Manage schedules')),
    floatingActionButton: FloatingActionButton(
      onPressed: () => _edit(context),
      child: const Icon(Icons.add),
    ),
    body: BlocBuilder<SchedulesCubit, List<Schedule>>(
      builder: (context, schedules) => ListView(
        padding: const EdgeInsets.all(16),
        children: schedules
            .map(
              (schedule) => Card(
                child: ListTile(
                  title: Text(schedule.label),
                  subtitle: Text(schedule.departureTime),
                  onTap: () => _edit(context, schedule),
                  trailing: IconButton(
                    icon: const Icon(Icons.visibility_off),
                    onPressed: () =>
                        context.read<SchedulesCubit>().deactivate(schedule.id),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ),
  );
  Future<void> _edit(BuildContext context, [Schedule? schedule]) async {
    final label = TextEditingController(text: schedule?.label),
        time = TextEditingController(text: schedule?.departureTime);
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Schedule'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: label,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: time,
              decoration: const InputDecoration(labelText: 'Departure (HH:mm)'),
            ),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (ok == true && context.mounted) {
      final institution = context.read<AuthBloc>().state.user!.institutionId!;
      await context.read<SchedulesCubit>().save(
        Schedule(
          id: schedule?.id ?? const Uuid().v4(),
          institutionId: institution,
          label: label.text,
          departureTime: time.text,
          expectedBusId: schedule?.expectedBusId,
          expectedRouteId: schedule?.expectedRouteId,
        ),
      );
    }
    label.dispose();
    time.dispose();
  }
}

class AdminLiveMonitorPage extends StatelessWidget {
  const AdminLiveMonitorPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Live monitor')),
    body: BlocBuilder<BusesBloc, BusesState>(
      builder: (_, state) => ListView(
        padding: const EdgeInsets.all(16),
        children: state.buses
            .map(
              (item) => Card(
                child: ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: item.status?.isLive == true
                        ? Colors.green
                        : Colors.grey,
                    size: 14,
                  ),
                  title: Text(item.bus.name),
                  subtitle: Text(
                    item.status?.isLive == true
                        ? '${item.status!.status.name.toUpperCase()} · Near ${item.status?.nearestStop ?? 'detecting'}'
                        : 'OFFLINE',
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ),
  );
}

class AdminReferralPage extends StatelessWidget {
  const AdminReferralPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Referral approvals')),
    body: StreamBuilder<List<ReferralClaim>>(
      stream: context.read<ReferralRepository>().watchPendingClaims(),
      builder: (context, snapshot) {
        final claims = snapshot.data ?? const [];
        if (claims.isEmpty) {
          return const Center(child: Text('No pending referral claims'));
        }
        return ListView(
          padding: const EdgeInsets.all(16),
          children: claims
              .map(
                (claim) => Card(
                  child: ListTile(
                    title: Text(claim.referralCode),
                    subtitle: Text(
                      'Referrer: ${claim.referrerUserId}\nClaimant: ${claim.claimantUserId}',
                    ),
                    isThreeLine: true,
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () => context
                              .read<ReferralRepository>()
                              .review(claim.id, false),
                          icon: const Icon(Icons.close, color: Colors.red),
                        ),
                        IconButton(
                          onPressed: () => context
                              .read<ReferralRepository>()
                              .review(claim.id, true),
                          icon: const Icon(Icons.check, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    ),
  );
}

class AdminTokenGrantPage extends StatelessWidget {
  const AdminTokenGrantPage({super.key});
  @override
  Widget build(BuildContext context) {
    final uid = TextEditingController(),
        amount = TextEditingController(text: '100');
    return Scaffold(
      appBar: AppBar(title: const Text('Grant test tokens')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'For technical testing only. Every adjustment creates a ledger entry.',
          ),
          const SizedBox(height: 16),
          TextField(
            controller: uid,
            decoration: const InputDecoration(labelText: 'User UID'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: amount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Token amount'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () async {
              final value = int.tryParse(amount.text);
              if (uid.text.isNotEmpty && value != null) {
                await context.read<WalletRepository>().grantTestTokens(
                  uid.text.trim(),
                  value,
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Test tokens granted.')),
                  );
                }
              }
            },
            child: const Text('Grant tokens'),
          ),
        ],
      ),
    );
  }
}

class AdminContributionRewardsPage extends StatelessWidget {
  const AdminContributionRewardsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final institution = context.read<AuthBloc>().state.user!.institutionId!;
    return Scaffold(
      appBar: AppBar(title: const Text('Contribution rewards')),
      body: StreamBuilder<List<ContributionSummary>>(
        stream: context.read<ContributionRewardRepository>().watchPending(
          institution,
        ),
        builder: (context, snapshot) {
          final items = snapshot.data ?? const [];
          if (items.isEmpty) {
            return const Center(
              child: Text('No pending contribution summaries'),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: items
                .map(
                  (item) => Card(
                    child: ListTile(
                      title: Text(
                        'Bus ${item.busId} · ${item.durationSeconds ~/ 60} min',
                      ),
                      subtitle: Text(
                        '${item.wasPrimary ? 'Primary source' : 'Standby'} · User ${item.userId}',
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () => context
                                .read<ContributionRewardRepository>()
                                .review(item, false),
                            icon: const Icon(Icons.close, color: Colors.red),
                          ),
                          IconButton(
                            onPressed: () => context
                                .read<ContributionRewardRepository>()
                                .review(item, true),
                            icon: const Icon(Icons.check, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class DebugGpsSimulatorPage extends StatefulWidget {
  const DebugGpsSimulatorPage({super.key});
  @override
  State<DebugGpsSimulatorPage> createState() => _DebugGpsSimulatorPageState();
}

class _DebugGpsSimulatorPageState extends State<DebugGpsSimulatorPage> {
  double progress = 0, noise = 0;
  bool reverse = false, stopped = false;
  String? busId, routeId;
  @override
  Widget build(BuildContext context) {
    final buses = context
            .watch<BusesBloc>()
            .state
            .buses
            .map((item) => item.bus)
            .toList(),
        routes = context.watch<RoutesCubit>().state;
    busId ??= buses.firstOrNull?.id;
    routeId ??= routes.firstOrNull?.id;
    return Scaffold(
      appBar: AppBar(title: const Text('Debug GPS simulator')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DropdownButtonFormField(
            initialValue: busId,
            decoration: const InputDecoration(labelText: 'Bus'),
            items: buses
                .map(
                  (bus) =>
                      DropdownMenuItem(value: bus.id, child: Text(bus.name)),
                )
                .toList(),
            onChanged: (value) => setState(() => busId = value),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField(
            initialValue: routeId,
            decoration: const InputDecoration(labelText: 'Route'),
            items: routes
                .map(
                  (route) => DropdownMenuItem(
                    value: route.id,
                    child: Text(route.name),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() => routeId = value),
          ),
          const SizedBox(height: 20),
          Text('Progress ${(progress * 100).round()}%'),
          Slider(
            value: progress,
            onChanged: (value) {
              setState(() => progress = value);
              _emit(context, buses, routes);
            },
          ),
          SwitchListTile(
            value: reverse,
            onChanged: (value) => setState(() => reverse = value),
            title: const Text('Reverse direction'),
          ),
          SwitchListTile(
            value: stopped,
            onChanged: (value) => setState(() => stopped = value),
            title: const Text('Stopped'),
          ),
          Text('GPS noise ${noise.round()}m'),
          Slider(
            value: noise,
            max: 200,
            onChanged: (value) => setState(() => noise = value),
          ),
          FilledButton(
            onPressed: () => _emit(context, buses, routes),
            child: const Text('Emit location'),
          ),
          OutlinedButton(
            onPressed: busId == null
                ? null
                : () => context.read<DebugGpsSimulator>().offline(
                    context.read<AuthBloc>().state.user!.institutionId!,
                    busId!,
                  ),
            child: const Text('Simulate offline'),
          ),
          OutlinedButton(
            onPressed: busId == null || routeId == null
                ? null
                : () {
                    final route = routes.firstWhere(
                      (item) => item.id == routeId,
                    );
                    context.read<DebugGpsSimulator>().emit(
                      institutionId: context
                          .read<AuthBloc>()
                          .state
                          .user!
                          .institutionId!,
                      busId: busId!,
                      route: route,
                      progress: progress,
                      lost: true,
                    );
                  },
            child: const Text('Simulate GPS lost'),
          ),
        ],
      ),
    );
  }

  void _emit(BuildContext context, List<Bus> buses, List<BusRoute> routes) {
    if (busId == null || routeId == null) return;
    context.read<DebugGpsSimulator>().emit(
      institutionId: context.read<AuthBloc>().state.user!.institutionId!,
      busId: busId!,
      route: routes.firstWhere((route) => route.id == routeId),
      progress: progress,
      reverse: reverse,
      stopped: stopped,
      noiseMeters: noise,
    );
  }
}
