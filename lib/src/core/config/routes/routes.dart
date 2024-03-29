import 'package:flutter/material.dart';
import '../../../features/presentation/pages/Intro/intro_screen.dart';
import '../../../features/presentation/pages/Auth/login/login_screen.dart';
import '../../../features/presentation/pages/Auth/forgot Password/forgot_password_screen.dart';

var routes = <String, WidgetBuilder>{
  // ! Intro
  '/': (context) => IntroScreen(),
  // ! Authentications
  '/login': (context) => LoginScreen(),
  '/forgot_password': (context) => ForgotPasswordScreen(),
};
