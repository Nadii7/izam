import '../entity/login_result.dart';
import '../repository/user_repository.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase(this.userRepository);

  Future<LoginResult> login(String email, String password) async {
    try {
      final user = await userRepository.loginUser(email, password);
      user!.loginCount++;
      await userRepository.updateUser(user);
      return LoginResult.success(user);
    } catch (e) {
      return LoginResult.failure();
    }
  }
}