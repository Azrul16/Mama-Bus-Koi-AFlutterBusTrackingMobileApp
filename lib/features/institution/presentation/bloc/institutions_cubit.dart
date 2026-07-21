import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/institution.dart';
import '../../domain/repositories/institution_repository.dart';

class InstitutionsCubit extends Cubit<List<Institution>> {
  InstitutionsCubit(this._repository) : super(const []);
  final InstitutionRepository _repository;
  StreamSubscription? _subscription;
  Future<void> start() async {
    _subscription = _repository.watchInstitutions().listen(emit);
    try {
      await _repository.refresh();
    } catch (_) {
      /* Cached list remains available. */
    }
  }

  Future<String> createOrganization({
    required String ownerId,
    required String name,
    required String location,
    required OrganizationType type,
  }) => _repository.createOrganization(
    ownerId: ownerId,
    name: name,
    location: location,
    type: type,
  );

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
