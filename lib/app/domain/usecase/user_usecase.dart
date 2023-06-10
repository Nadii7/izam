import '../entity/user.dart';
import '../repository/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase(this.userRepository);

  Future<LoginResult> login(String email, String password) async {
    try {
      final user = await userRepository.loginUser(email, password);
      user.loginCount++;
      await userRepository.updateUser(user);
      return LoginResult.success(user);
    } catch (e) {
      return LoginResult.failure();
    }
  }

  Future<LoginResult> resetPassword(String email) async {
    try {
      final user = await userRepository.changePasswordByEmail(email);
      return LoginResult.success(user!);
    } catch (e) {
      return LoginResult.failure();
    }
  }
}

class LoginResult {
  final bool success;
  final User? user;

  LoginResult({required this.success, required this.user});

  factory LoginResult.success(User user) =>
      LoginResult(success: true, user: user);

  factory LoginResult.failure() => LoginResult(success: false, user: null);
}
