import 'package:sqflite/sqflite.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../../../core/utils/extensions/extensions.dart';

class UserRepositoryImpl implements UserRepository {
  final Database _database;

  UserRepositoryImpl(this._database);

  @override
  Future<User?> loginUser(String email, String password) async {
    try {
      final result = await _database.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );
      if (result.isEmpty) {
        final id = await _database.rawInsert(
          'INSERT INTO users(email, password, loginCount) VALUES (?, ?, ?)',
          [email, password, 0],
        );
        final newUser =
            User(id: id, email: email, loginCount: 0, password: password);
        return newUser.copyWith(id: id);
      }
      final storedUser = User.fromMap(result.first);
      if (storedUser.password == password) return storedUser;
      return null;
    } catch (e) {
      throw UserRepositoryException('Failed to get user: $e');
    }
  }

  @override
  Future<void> updateUser(User user) async {
    try {
      await _database.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
    } catch (e) {
      throw UserRepositoryException('Failed to update user: $e');
    }
  }

  @override
  Future<User?> resetPassword(String email) async {
    try {
      final result = await _database.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
      );
      if (result.isEmpty) return null;
      final generatedPassword = generatePassword();
      final updatedUser =
          User.fromMap(result.first).copyWith(password: generatedPassword);
      await _database.update(
        'users',
        updatedUser.toMap(),
        where: 'email = ?',
        whereArgs: [email],
      );
      return updatedUser;
    } catch (e) {
      throw UserRepositoryException('Failed to change password: $e');
    }
  }
}

class UserRepositoryException implements Exception {
  final String message;

  UserRepositoryException(this.message);

  @override
  String toString() => 'UserRepositoryException: $message';
}
