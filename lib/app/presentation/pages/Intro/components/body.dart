import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250.w,
        child: SvgPicture.asset(
          "assets/images/logo.svg",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
