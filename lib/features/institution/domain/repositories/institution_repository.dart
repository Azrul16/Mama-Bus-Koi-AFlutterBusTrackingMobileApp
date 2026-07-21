import '../entities/institution.dart';

abstract interface class InstitutionRepository {
  Stream<List<Institution>> watchInstitutions();
  Future<void> refresh();
  Future<String> createOrganization({
    required String ownerId,
    required String name,
    required String location,
    required OrganizationType type,
  });
}
