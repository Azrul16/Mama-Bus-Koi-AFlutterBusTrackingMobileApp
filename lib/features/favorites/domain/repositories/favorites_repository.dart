abstract interface class FavoritesRepository {
  Stream<Set<String>> watchFavoriteBusIds(String userId, String institutionId);
  Future<void> toggle(
    String userId,
    String institutionId,
    String busId,
    bool favorite,
  );
}
