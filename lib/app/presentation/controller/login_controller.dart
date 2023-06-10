import 'package:provider/provider.dart';
import '../../domain/usecase/user_usecase.dart';
import '../widgets/Dialogs/custom_snackbar.dart';

Future<void> tryLogin({
  required context,
  required String email,
  required String password,
}) async {
  final auth = Provider.of<UserUseCase>(context, listen: false);
  final result = await auth.login(email, password);

  if (result.success) {
    showCustomSnack(
      context,
      'Login successful! You have logged in ${result.user!.loginCount} times.',
    );
  } else {
    showCustomSnack(
      context,
      'Invalid email or password.',
    );
  }
}
