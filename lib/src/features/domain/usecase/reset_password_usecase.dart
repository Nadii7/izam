import '../entity/login_result.dart';
import '../repository/user_repository.dart';

class ResetPasswordUseCase {
  final UserRepository userRepository;

  ResetPasswordUseCase(this.userRepository);

  Future<LoginResult> resetPassword(String email) async {
    try {
      final user = await userRepository.resetPassword(email);
      return LoginResult.success(user!);
    } catch (e) {
      return LoginResult.failure();
    }
  }
}
