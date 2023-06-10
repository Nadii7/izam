import '../../../../../core/utils/constants/constants.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      backgroundColor: secondaryBackground,
      appBar: AppBar(title: Text("Forgot Password")),
    );
  }
}
