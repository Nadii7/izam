import '../entity/user.dart';
import '../repository/user_repository.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase(this.userRepository);

  Future<LoginResult> login(String email, String password) async {
    try {
      final user = await userRepository.loginUser(email, password);
      user.loginCount++;
      await userRepository.updateUser(user);
      return LoginResult.success(user);
    } catch (e) {
      return LoginResult.failure(LoginError.unknownError);
    }
  }
}

enum LoginError {
  invalidCredentials,
  unknownError,
}

class LoginResult {
  final bool success;
  final User? user;

  LoginResult({required this.success, required this.user});

  factory LoginResult.success(User user) =>
      LoginResult(success: true, user: user);

  factory LoginResult.failure(LoginError error) =>
      LoginResult(success: false, user: null);
}
