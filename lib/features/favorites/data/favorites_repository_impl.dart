import 'package:drift/drift.dart' hide Column;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/database/app_database.dart' as db;
import '../domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl(this._database, this._firestore);
  final db.AppDatabase _database;
  final FirebaseFirestore _firestore;
  @override
  Stream<Set<String>> watchFavoriteBusIds(
    String userId,
    String institutionId,
  ) =>
      (_database.select(_database.favorites)..where(
            (row) =>
                row.userId.equals(userId) &
                row.institutionId.equals(institutionId),
          ))
          .watch()
          .map((rows) => rows.map((row) => row.busId).toSet());
  @override
  Future<void> toggle(
    String userId,
    String institutionId,
    String busId,
    bool favorite,
  ) async {
    final ref = _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(busId);
    if (favorite) {
      await ref.set({
        'institutionId': institutionId,
        'busId': busId,
        'notificationsEnabled': true,
      });
      await _database
          .into(_database.favorites)
          .insert(
            db.FavoritesCompanion.insert(
              userId: userId,
              institutionId: institutionId,
              busId: busId,
            ),
            mode: InsertMode.insertOrReplace,
          );
    } else {
      await ref.delete();
      await (_database.delete(_database.favorites)..where(
            (row) => row.userId.equals(userId) & row.busId.equals(busId),
          ))
          .go();
    }
  }
}
