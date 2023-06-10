import 'dart:async';
import 'components/body.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  static String routeName = "/";
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  
  startTime() async {
    return Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, '/login'),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
