import 'package:provider/provider.dart';
import '../widgets/Dialogs/custom_dialog.dart';
import '../widgets/Dialogs/custom_snackbar.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../domain/usecase/reset_password_usecase.dart';

Future<void> resetPassword({
  required context,
  required String email,
}) async {
  final user = Provider.of<ResetPasswordUseCase>(context, listen: false);
  final result = await user.resetPassword(email);
  result.success
      ? showAlertDialog(
          context: context,
          titleTxt: AppStrings.done,
          contentTxt:
              'successful! Your Password has been changed. New password: ${result.user!.password}',
        )
      : showCustomSnack(
          context,
          'No user exists with the provided email try login.',
        );
}
