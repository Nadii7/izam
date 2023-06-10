import 'package:provider/provider.dart';
import '../widgets/Dialogs/custom_dialog.dart';
import '../../domain/usecase/user_usecase.dart';
import '../widgets/Dialogs/custom_snackbar.dart';
import '../../../core/utils/constants/app_strings.dart';

Future<void> resetPassword({
  required context,
  required String email,
}) async {
  final user = Provider.of<UserUseCase>(context, listen: false);
  final result = await user.resetPassword(email);

  if (result.success) {
    showAlertDialog(
      context: context,
      titleTxt: AppStrings.done,
      contentTxt:
          'successful! Your Password has been changed. New password: ${result.user!.password}',
    );
  } else {
    showCustomSnack(
      context,
      'No user exists with the provided email try login.',
    );
  }
}
