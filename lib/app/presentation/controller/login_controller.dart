import 'package:izam/app/presentation/widgets/Dialogs/custom_snackbar.dart';
import 'package:provider/provider.dart';
import '../../domain/usecase/login_usecase.dart';

Future<void> tryLogin({
  required context,
  required String email,
  required String password,
}) async {
  final auth = Provider.of<LoginUseCase>(context, listen: false);
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
