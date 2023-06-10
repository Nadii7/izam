import 'package:provider/provider.dart';
import '../widgets/Dialogs/custom_dialog.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../../core/utils/constants/app_strings.dart';

Future<void> tryLogin({
  required context,
  required String email,
  required String password,
}) async {
  final auth = Provider.of<LoginUseCase>(context, listen: false);
  final result = await auth.login(email, password);
  result.success
      ? showAlertDialog(
          context: context,
          titleTxt: AppStrings.loginSuccess,
          contentTxt:
              ' Email: ${result.user!.email}\n Password: ${result.user!.password}\n Login Count: ${result.user!.loginCount} times.',
        )
      : showAlertDialog(
          context: context,
          titleTxt: AppStrings.loginFails,
          contentTxt: 'Invalid password try again with different password.',
        );
}
