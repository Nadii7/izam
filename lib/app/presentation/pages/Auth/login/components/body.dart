import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:izam/app/presentation/controller/login_controller.dart';
import '../../../../Widgets/Button/custom_button.dart';
import '../../../../Widgets/Text/custom_mail_field.dart';
import '../../../../Widgets/Text/custom_action_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Widgets/Text/custom_password_field.dart';
import '../../../../../../core/utils/constants/constants.dart';
import '../../../../../../core/utils/extensions/extensions.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  bool _isDisabled = true;
  final TextEditingController mailController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void checkInputFields() {
    if (mailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        mailController.text.isEmail == false ||
        passwordController.text.isPassword == false) {
      setState(() => _isDisabled = true);
    } else {
      setState(() => _isDisabled = false);
    }
  }

  Future<void> _loginUser(context) async {
    setState(() {
      _isLoading = true;
      _isDisabled = true;
    });
    //! get response from ApiClient
    await tryLogin(
      context: context,
      email: mailController.text,
      password: passwordController.text,
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                fit: BoxFit.fitHeight,
              ),
            ),
            const Spacer(flex: 1),
            //! Email Field
            CustomMailInputField(
              controller: mailController,
              onChanged: (value) => checkInputFields(),
            ),
            SizedBox(height: 16.h),
            //! Password Field
            CustomPasswordInputField(
              controller: passwordController,
              onChanged: (value) => checkInputFields(),
            ),
            SizedBox(height: 10.h),
            //! Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomActionText(
                  color: primaryText,
                  fontWeight: FontWeight.w600,
                  actionText: 'Forgot Password',
                  onTap: () => Navigator.pushNamed(context, '/forgot_password'),
                ),
              ],
            ),
            const Spacer(flex: 1),
            //! Sign In Button
            CustomButton(
              isLoading: _isLoading,
              isDisabled: _isDisabled,
              text: 'log in'.toUpperCase(),
              onPress: () => _loginUser(context),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
