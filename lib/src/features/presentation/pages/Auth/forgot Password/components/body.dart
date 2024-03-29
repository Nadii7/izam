import 'package:flutter/material.dart';
import '../../../../Widgets/Button/custom_button.dart';
import '../../../../widgets/text/custom_mail_field.dart';
import '../../../../../../core/config/themes/theme.dart';
import '../../../../controller/forgot_pass_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants/constants.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/extensions/extensions.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController mailController = TextEditingController();
  bool _isDisabled = true;
  bool _isLoading = false;

  void checkInputFields() {
    if (mailController.text.trim().isEmpty ||
        mailController.text.isEmail == false) {
      setState(() {
        _isDisabled = true;
      });
    } else {
      setState(() {
        _isDisabled = false;
      });
    }
  }

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword(context) async {
    //! disable button
    setState(() {
      _isLoading = true;
      _isDisabled = true;
    });
    // ! request data
    await resetPassword(
      context: context,
      email: mailController.text,
    );
    setState(() {
      _isLoading = false;
      _isDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.forgotPassDescription,
              style: customTextStyle(
                height: 1.2,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).hintColor,
              ),
            ),
            SizedBox(height: 20.h),
            CustomMailInputField(
              controller: mailController,
              onChanged: (value) => checkInputFields(),
            ),
            SizedBox(height: 10.h),
            CustomButton(
              isLoading: _isLoading,
              isDisabled: _isDisabled,
              text: AppStrings.resetPassword,
              onPress: () => _resetPassword(context),
            ),
          ],
        ),
      ),
    );
  }
}
