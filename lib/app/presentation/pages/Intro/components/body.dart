import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: SvgPicture.asset(
          "assets/images/logo.svg",
        ),
      ),
    );
  }
}
