abstract final class FirebasePaths {
  static const organizations = 'organizations';
  static const institutions = organizations;
  static const memberships = 'organization_memberships';
  static const users = 'users';
  static String institution(String id) => '$organizations/$id';
  static String membership(String organizationId, String uid) =>
      '$memberships/${organizationId}_$uid';
  static String buses(String id) => '${institution(id)}/buses';
  static String routes(String id) => '${institution(id)}/routes';
  static String schedules(String id) => '${institution(id)}/schedules';
  static String busStatus(String institutionId, String busId) =>
      'bus_status/$institutionId/$busId';
  static String busLive(String institutionId, String busId) =>
      'bus_live/$institutionId/$busId';
}
