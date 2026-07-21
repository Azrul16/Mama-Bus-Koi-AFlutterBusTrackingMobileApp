import 'package:bloc_test/bloc_test.dart';
import 'package:buskoi/features/buses/domain/entities/bus.dart';
import 'package:buskoi/features/buses/domain/repositories/bus_repository.dart';
import 'package:buskoi/features/buses/presentation/bloc/buses_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeBusRepository implements BusRepository {
  final items = <BusWithStatus>[
    BusWithStatus(
      const Bus(
        id: 'bus_001',
        institutionId: 'pstu',
        name: 'Durbar',
        busNumber: 'PSTU-01',
        colorValue: 0xFF087A5B,
      ),
      PublicBusStatus(
        busId: 'bus_001',
        status: TrackingStatus.moving,
        direction: BusDirection.forward,
        updatedAt: DateTime(2026),
        nearestStop: 'Lebukhali',
      ),
    ),
  ];
  @override
  Future<void> refresh(String institutionId) async {}
  @override
  Future<void> saveBus(Bus bus) async {}
  @override
  Future<void> deactivateBus(String institutionId, String busId) async {}
  @override
  Future<void> deleteBus(String institutionId, String busId) async {}
  @override
  Stream<List<BusWithStatus>> watchBuses(String institutionId) =>
      Stream.value(items);
}

void main() {
  late FakeBusRepository repository;
  setUp(() => repository = FakeBusRepository());

  blocTest<BusesBloc, BusesState>(
    'loads cached buses and their public status',
    build: () => BusesBloc(repository),
    act: (bloc) => bloc.add(const BusesInstitutionChanged('pstu')),
    wait: const Duration(milliseconds: 10),
    verify: (bloc) {
      expect(bloc.state.status, BusesLoadStatus.success);
      expect(bloc.state.buses.single.bus.name, 'Durbar');
      expect(bloc.state.buses.single.status?.nearestStop, 'Lebukhali');
    },
  );

  blocTest<BusesBloc, BusesState>(
    'filters buses without changing repository state',
    build: () => BusesBloc(repository),
    seed: () =>
        BusesState(status: BusesLoadStatus.success, buses: repository.items),
    act: (bloc) => bloc.add(const BusesQueryChanged('missing')),
    verify: (bloc) => expect(bloc.state.visibleBuses, isEmpty),
  );
}
