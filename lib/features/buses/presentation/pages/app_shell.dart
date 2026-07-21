import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/map/open_map.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../routes/domain/entities/route.dart';
import '../../../routes/presentation/bloc/routes_cubit.dart';
import '../../../tracking/domain/entities/live_bus.dart';
import '../../../tracking/domain/repositories/tracking_repository.dart';
import '../../../tracking/presentation/bloc/contributor_cubit.dart';
import '../../../favorites/domain/repositories/favorites_repository.dart';
import '../../../referrals/domain/repositories/referral_repository.dart';
import '../../../wallet/domain/repositories/wallet_repository.dart';
import '../../../../core/notifications/notification_service.dart';
import '../../../schedules/presentation/bloc/schedules_cubit.dart';
import '../../../schedules/domain/entities/schedule.dart';
import '../../../wallet/presentation/bloc/wallet_cubit.dart';
import '../../domain/entities/bus.dart';
import '../bloc/buses_bloc.dart';
import '../../../chat/presentation/pages/chat_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int index = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: IndexedStack(
        index: index,
        children: const [
          BusesPage(),
          RoutesPage(),
          SchedulesPage(),
          ChatPage(),
          WalletPage(),
        ],
      ),
    ),
    bottomNavigationBar: NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (value) => setState(() => index = value),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.directions_bus_outlined),
          selectedIcon: Icon(Icons.directions_bus),
          label: 'Buses',
        ),
        NavigationDestination(icon: Icon(Icons.alt_route), label: 'Routes'),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Schedules',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chat',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'Wallet',
        ),
      ],
    ),
  );
}

class BusesPage extends StatelessWidget {
  const BusesPage({super.key});
  @override
  Widget build(BuildContext context) => RefreshIndicator(
    onRefresh: () async =>
        context.read<BusesBloc>().add(const BusesRefreshed()),
    child: CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 14),
          sliver: SliverList.list(
            children: [
              const _BrandHeader(),
              const SizedBox(height: 26),
              const Text(
                'Bus koi, mama?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -.8,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Live status, routes and schedules — all in one place.',
                style: TextStyle(color: Color(0xFF68736C)),
              ),
              const SizedBox(height: 18),
              TextField(
                onChanged: (value) =>
                    context.read<BusesBloc>().add(BusesQueryChanged(value)),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search a bus',
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'All buses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        BlocBuilder<BusesBloc, BusesState>(
          builder: (context, state) {
            if (state.status == BusesLoadStatus.loading &&
                state.buses.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state.visibleBuses.isEmpty) {
              return const SliverFillRemaining(
                child: Center(
                  child: _EmptyCard(
                    text: 'No buses found nearby',
                    asset: 'assets/illustrations/bus_stop.svg',
                  ),
                ),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 30),
              sliver: SliverList.separated(
                itemCount: state.visibleBuses.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final item = state.visibleBuses[index];
                  return _BusCard(
                    item: item,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BusDetailsPage(item: item),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();
  @override
  Widget build(BuildContext context) => Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          'assets/applogo/applogo.png',
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 12),
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MAMA BUS KOI',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
            ),
            Text(
              'Organization transport',
              style: TextStyle(color: Color(0xFF68736C)),
            ),
          ],
        ),
      ),
      PopupMenuButton<String>(
        icon: const Icon(Icons.account_circle_outlined),
        onSelected: (value) {
          if (value == 'profile') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          }
          if (value == 'logout') {
            context.read<AuthBloc>().add(const AuthSignOutRequested());
          }
        },
        itemBuilder: (_) => const [
          PopupMenuItem(value: 'profile', child: Text('Profile')),
          PopupMenuItem(value: 'logout', child: Text('Sign out')),
        ],
      ),
    ],
  );
}

class _BusCard extends StatelessWidget {
  const _BusCard({required this.item, required this.onTap});
  final BusWithStatus item;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final live = item.status?.isLive ?? false;
    final color = Color(item.bus.colorValue);
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: .12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(Icons.directions_bus, color: color),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.bus.name.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          item.bus.busNumber,
                          style: const TextStyle(
                            color: Color(0xFF68736C),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _StatusPill(live: live),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                live
                    ? _directionLabel(item.status!.direction)
                    : 'Not currently live',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    live ? Icons.location_on_outlined : Icons.schedule,
                    size: 18,
                    color: const Color(0xFF68736C),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      live
                          ? 'Near ${item.status?.nearestStop ?? 'detecting route'}'
                          : 'Schedule available',
                      style: const TextStyle(color: Color(0xFF68736C)),
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _directionLabel(BusDirection value) => switch (value) {
    BusDirection.forward => 'Going →',
    BusDirection.reverse => 'Returning ←',
    BusDirection.unknown => 'Detecting route…',
  };
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.live});
  final bool live;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: live ? const Color(0xFFE2F5EC) : const Color(0xFFF0F1EF),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      live ? '● LIVE' : '○ OFFLINE',
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w900,
        color: live ? AppTheme.primary : const Color(0xFF68736C),
      ),
    ),
  );
}

class BusDetailsPage extends StatelessWidget {
  const BusDetailsPage({super.key, required this.item});
  final BusWithStatus item;
  @override
  Widget build(BuildContext context) {
    final wallet = context.watch<WalletCubit>().state.wallet;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.bus.name),
        actions: [_FavoriteButton(busId: item.bus.id)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CURRENT JOURNEY',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF68736C),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.status?.isLive == true
                        ? 'Live route detection active'
                        : 'Waiting for a GPS contributor',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.status?.nearestStop == null
                        ? 'No location available'
                        : 'Near ${item.status!.nearestStop}',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () => _confirmContribution(context),
            icon: const Icon(Icons.share_location),
            label: Text("I'M IN ${item.bus.name.toUpperCase()}"),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
            ),
          ),
          const SizedBox(height: 14),
          if (wallet?.hasPremium == true)
            _PremiumActive(item: item)
          else
            _PremiumLocked(
              onUnlock: () => context.read<WalletCubit>().unlockPremium(),
            ),
        ],
      ),
    );
  }

  Future<void> _confirmContribution(BuildContext context) async {
    final accepted = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        icon: const Icon(Icons.share_location, size: 40),
        title: Text('Are you inside ${item.bus.name}?'),
        content: const Text(
          'Your phone may temporarily share location to help other students. Foreground GPS starts only after your confirmation.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Yes, I'm in"),
          ),
        ],
      ),
    );
    if (accepted != true || !context.mounted) return;
    final user = context.read<AuthBloc>().state.user!;
    final started = await context.read<ContributorCubit>().start(
      institutionId: user.institutionId!,
      busId: item.bus.id,
      busName: item.bus.name,
      userId: user.uid,
      routes: context.read<RoutesCubit>().state,
    );
    if (context.mounted && started) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ContributorPage(bus: item.bus)),
      );
    }
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.busId});
  final String busId;
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user!;
    return StreamBuilder<Set<String>>(
      stream: context.read<FavoritesRepository>().watchFavoriteBusIds(
        user.uid,
        user.institutionId!,
      ),
      builder: (context, snapshot) {
        final selected = snapshot.data?.contains(busId) ?? false;
        return IconButton(
          onPressed: () => context.read<FavoritesRepository>().toggle(
            user.uid,
            user.institutionId!,
            busId,
            !selected,
          ),
          icon: Icon(
            selected ? Icons.favorite : Icons.favorite_border,
            color: selected ? Colors.red : null,
          ),
        );
      },
    );
  }
}

class _PremiumLocked extends StatelessWidget {
  const _PremiumLocked({required this.onUnlock});
  final VoidCallback onUnlock;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF103D34), AppTheme.primary],
      ),
      borderRadius: BorderRadius.circular(22),
    ),
    child: Column(
      children: [
        const Icon(Icons.lock_outline, color: Colors.white),
        const SizedBox(height: 8),
        const Text(
          'Exact live tracking',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 19,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Live map, speed, next stop and ETA for every bus.',
          style: TextStyle(color: Color(0xFFD6E8E1)),
        ),
        const SizedBox(height: 15),
        FilledButton(
          onPressed: onUnlock,
          style: FilledButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppTheme.primary,
          ),
          child: const Text('Unlock 24 hours · 10 tokens'),
        ),
        const Text(
          'No auto-renewal',
          style: TextStyle(color: Color(0xFFB8D5CB), fontSize: 11),
        ),
      ],
    ),
  );
}

class _PremiumActive extends StatelessWidget {
  const _PremiumActive({required this.item});
  final BusWithStatus item;
  @override
  Widget build(BuildContext context) {
    final institution = context.read<AuthBloc>().state.user!.institutionId!;
    final routes = context.watch<RoutesCubit>().state;
    final route = routes
        .where((route) => route.id == item.status?.detectedRouteId)
        .firstOrNull;
    return StreamBuilder<LiveBus?>(
      stream: context.read<TrackingRepository>().watchLiveBus(
        institution,
        item.bus.id,
      ),
      builder: (context, snapshot) {
        final live = snapshot.data;
        if (live == null) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 14),
                  Text('Waiting for exact live data…'),
                ],
              ),
            ),
          );
        }
        return Card(
          child: Column(
            children: [
              SizedBox(
                height: 260,
                child: OpenMap(
                  route: route,
                  livePoint: GeoPoint(live.latitude, live.longitude),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Metric(
                      'SPEED',
                      '${live.speedKph.toStringAsFixed(0)} km/h',
                    ),
                    _Metric(
                      'ETA',
                      live.etaSeconds == null
                          ? '—'
                          : '${(live.etaSeconds! / 60).ceil()} min',
                    ),
                    _Metric('NEXT', live.nextStop ?? '—'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric(this.label, this.value);
  final String label, value;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 10, color: Color(0xFF68736C)),
      ),
      Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
    ],
  );
}

class ContributorPage extends StatelessWidget {
  const ContributorPage({super.key, required this.bus});
  final Bus bus;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(bus.name), automaticallyImplyLeading: false),
    body: BlocConsumer<ContributorCubit, ContributorState>(
      listener: (context, state) {
        if (state.session == null) Navigator.pop(context);
      },
      builder: (context, state) {
        final session = state.session;
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Icon(Icons.share_location, size: 68, color: AppTheme.primary),
            const SizedBox(height: 16),
            Text(
              'You are helping track ${bus.name}.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      session?.isPrimarySource == true
                          ? 'PRIMARY GPS SOURCE'
                          : 'STANDBY CONTRIBUTOR',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'The primary source uploads live GPS. Standby contributors automatically take over if its lease expires.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => context.read<ContributorCubit>().stop(),
              icon: const Icon(Icons.stop_circle_outlined),
              label: const Text('I GOT OFF THE BUS'),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size.fromHeight(52),
              ),
            ),
          ],
        );
      },
    ),
  );
}

class RoutesPage extends StatelessWidget {
  const RoutesPage({super.key});
  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<RoutesCubit, List<BusRoute>>(
    builder: (context, routes) => ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const _PageTitle('Routes', 'Official routes cached for offline use'),
        if (routes.isEmpty)
          const _EmptyCard(
            text: 'No routes have been published yet',
            asset: 'assets/illustrations/route_planning.svg',
          )
        else
          ...routes.map(
            (route) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.alt_route),
                  title: Text(route.name),
                  subtitle: Text(
                    '${route.startName} ↔ ${route.endName}\n${route.stops.length} stops · ${(route.distanceMeters / 1000).toStringAsFixed(1)} km',
                  ),
                  isThreeLine: true,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: Text(route.name)),
                        body: OpenMap(route: route),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

class SchedulesPage extends StatelessWidget {
  const SchedulesPage({super.key});
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SchedulesCubit, List<Schedule>>(
        builder: (context, schedules) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const _PageTitle(
              'Schedules',
              'Cached locally and synchronized from Firestore',
            ),
            if (schedules.isEmpty)
              const _EmptyCard(
                text: 'No schedules have been published yet',
                asset: 'assets/illustrations/schedule.svg',
              )
            else
              ...schedules.map(
                (item) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.schedule),
                    title: Text(item.label),
                    subtitle: Text(item.departureTime),
                    trailing: IconButton(
                      icon: const Icon(Icons.notifications_active_outlined),
                      onPressed: () => _scheduleReminder(context, item),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );

  Future<void> _scheduleReminder(
    BuildContext context,
    Schedule schedule,
  ) async {
    final pieces = schedule.departureTime.split(':');
    if (pieces.length != 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Use HH:mm departure format before scheduling.'),
        ),
      );
      return;
    }
    await context.read<NotificationService>().scheduleBusReminder(
      id: schedule.id.hashCode & 0x7fffffff,
      busName: schedule.label,
      hour: int.tryParse(pieces[0]) ?? 7,
      minute: int.tryParse(pieces[1]) ?? 0,
      payload: schedule.expectedBusId ?? 'schedule:${schedule.id}',
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Daily schedule reminder enabled.')),
      );
    }
  }
}

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});
  @override
  Widget build(BuildContext context) => BlocBuilder<WalletCubit, WalletState>(
    builder: (context, state) {
      final wallet = state.wallet;
      final user = context.read<AuthBloc>().state.user;
      return ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const _PageTitle('Wallet', 'Tokens and premium access'),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF103D34), AppTheme.primary],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TOKEN BALANCE',
                  style: TextStyle(
                    color: Color(0xFFB8D5CB),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${wallet?.tokens ?? 0} 🪙',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  wallet?.hasPremium == true
                      ? 'Premium access is active'
                      : '10 tokens unlocks 24 hours',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.group_add)),
              title: Text('Referral code: ${user?.referralCode ?? '—'}'),
              subtitle: const Text(
                'Enter a friend’s code. Rewards require admin approval.',
              ),
              onTap: user == null
                  ? null
                  : () => _claimReferral(context, user.uid),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.payments_outlined)),
              title: const Text('Buy tokens'),
              subtitle: const Text(
                'Payment provider is intentionally disabled in this MVP',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TokenStorePage()),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Transactions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          if (user != null)
            StreamBuilder(
              stream: context.read<WalletRepository>().watchTransactions(
                user.uid,
              ),
              builder: (context, snapshot) {
                final transactions = snapshot.data ?? const [];
                if (transactions.isEmpty) {
                  return const _EmptyCard(
                    text: 'No transactions yet',
                    asset: 'assets/illustrations/empty_wallet.svg',
                  );
                }
                return Column(
                  children: transactions
                      .map(
                        (transaction) => ListTile(
                          title: Text(
                            transaction.details ?? transaction.type.name,
                          ),
                          subtitle: Text(
                            transaction.createdAt.toLocal().toString(),
                          ),
                          trailing: Text(
                            '${transaction.amount > 0 ? '+' : ''}${transaction.amount} 🪙',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: transaction.amount > 0
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
        ],
      );
    },
  );

  Future<void> _claimReferral(BuildContext context, String uid) async {
    final controller = TextEditingController();
    final code = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Referral code'),
        content: TextField(
          controller: controller,
          textCapitalization: TextCapitalization.characters,
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
    controller.dispose();
    if (code?.trim().isEmpty != false || !context.mounted) return;
    try {
      await context.read<ReferralRepository>().createClaim(
        claimantUserId: uid,
        referralCode: code!,
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Referral submitted for admin approval.'),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }
}

class TokenStorePage extends StatelessWidget {
  const TokenStorePage({super.key});
  @override
  Widget build(BuildContext context) => BlocListener<WalletCubit, WalletState>(
    listenWhen: (previous, current) =>
        previous.message != current.message && current.message != null,
    listener: (context, state) => ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(state.message!))),
    child: Scaffold(
      appBar: AppBar(title: const Text('Token Store')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Choose a token pack',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          const Text(
            'Claim a one-time welcome gift. Payments will be connected later.',
          ),
          const SizedBox(height: 20),
          BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) => _TokenPack(
              100,
              'Free welcome gift',
              welcomeGift: true,
              claimed: state.wallet?.freeTokensClaimed ?? false,
              processing: state.processing,
            ),
          ),
          const _TokenPack(500, '৳25'),
          const _TokenPack(1000, '৳50'),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'Paid purchases are disabled. Do not send money.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _TokenPack extends StatelessWidget {
  const _TokenPack(
    this.tokens,
    this.price, {
    this.welcomeGift = false,
    this.claimed = false,
    this.processing = false,
  });
  final int tokens;
  final String price;
  final bool welcomeGift, claimed, processing;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: const CircleAvatar(child: Icon(Icons.toll)),
        title: Text(
          '$tokens tokens',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        subtitle: Text(price),
        trailing: FilledButton(
          onPressed: welcomeGift && !claimed && !processing
              ? () => context.read<WalletCubit>().claimWelcomeTokens()
              : null,
          child: Text(
            welcomeGift ? (claimed ? 'Claimed' : 'Get') : 'Unavailable',
          ),
        ),
      ),
    ),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().state.user!;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SvgPicture.asset('assets/illustrations/profile.svg', height: 150),
          const SizedBox(height: 14),
          Text(
            user.displayName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          Text(user.email, textAlign: TextAlign.center),
          const SizedBox(height: 22),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.school_outlined),
                  title: const Text('Institution'),
                  subtitle: Text(user.institutionId ?? 'Not selected'),
                ),
                ListTile(
                  leading: const Icon(Icons.badge_outlined),
                  title: const Text('Role'),
                  subtitle: Text(user.role.name),
                ),
                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Gender'),
                  subtitle: Text(user.gender ?? '—'),
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_outlined),
                  title: const Text('Department'),
                  subtitle: Text(user.department ?? '—'),
                ),
                ListTile(
                  leading: const Icon(Icons.share_outlined),
                  title: const Text('Referral code'),
                  subtitle: Text(user.referralCode ?? '—'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () =>
                context.read<AuthBloc>().add(const AuthSignOutRequested()),
            icon: const Icon(Icons.logout),
            label: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle(this.title, this.subtitle);
  final String title, subtitle;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 22),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: Color(0xFF68736C))),
      ],
    ),
  );
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({
    required this.text,
    this.asset = 'assets/illustrations/travel_plans.svg',
  });
  final String text;
  final String asset;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          SvgPicture.asset(asset, height: 130),
          const SizedBox(height: 12),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
