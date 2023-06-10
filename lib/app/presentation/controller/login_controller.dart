import 'package:provider/provider.dart';
import '../widgets/Dialogs/custom_dialog.dart';
import '../../domain/usecase/user_usecase.dart';
import '../../../core/utils/constants/app_strings.dart';

Future<void> tryLogin({
  required context,
  required String email,
  required String password,
}) async {
  final auth = Provider.of<UserUseCase>(context, listen: false);
  final result = await auth.login(email, password);

  if (result.success) {
    showAlertDialog(
      context: context,
      titleTxt: AppStrings.loginSuccess,
      contentTxt:
          ' Email: ${result.user!.email}\n Password: ${result.user!.password}\n Login Count: ${result.user!.loginCount} times.',
    );
  } else {
    showAlertDialog(
      context: context,
      titleTxt: AppStrings.loginFails,
      contentTxt: 'Invalid password try again with different password.',
    );
  }
}
