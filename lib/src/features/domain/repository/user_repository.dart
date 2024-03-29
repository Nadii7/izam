import '../entity/user.dart';

abstract class UserRepository {
  Future<void> updateUser(User user);
  Future<User?> resetPassword(String email);
  Future<User?> loginUser(String email, String password);
}
