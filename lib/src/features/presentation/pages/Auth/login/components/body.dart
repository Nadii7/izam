import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../controller/login_controller.dart';
import '../../../../Widgets/Button/custom_button.dart';
import '../../../../../../core/config/themes/theme.dart';
import '../../../../Widgets/Text/custom_mail_field.dart';
import '../../../../Widgets/Text/custom_action_text.dart';
import '../../../../Widgets/Text/custom_password_field.dart';
import '../../../../../../core/utils/constants/constants.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 200,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 375,
              height: 365,
              decoration: cardDecoration(),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    AppStrings.welcome,
                    style: customTextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Spacer(flex: 2),
                  //! Email Field
                  CustomMailInputField(
                    controller: mailController,
                    onChanged: (value) => checkInputFields(),
                  ),
                  Spacer(flex: 1),
                  //! Password Field
                  CustomPasswordInputField(
                    controller: passwordController,
                    onChanged: (value) => checkInputFields(),
                  ),
                  Spacer(flex: 1),
                  //! Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomActionText(
                        color: primaryText,
                        fontWeight: FontWeight.w700,
                        actionText: AppStrings.forgotPassword,
                        onTap: () =>
                            Navigator.pushNamed(context, '/forgot_password'),
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  //! Sign In Button
                  CustomButton(
                    isLoading: _isLoading,
                    isDisabled: _isDisabled,
                    onPress: () => _loginUser(context),
                    text: AppStrings.login.toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
