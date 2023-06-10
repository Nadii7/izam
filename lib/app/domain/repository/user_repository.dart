import '../entity/user.dart';

abstract class UserRepository {
  Future<User> loginUser(String email, String password);
  Future<void> updateUser(User user);
}
