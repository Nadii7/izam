import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/themes/theme.dart';
import '../../../../core/utils/constants/constants.dart';

class CustomActionText extends StatelessWidget {
  const CustomActionText({
    Key? key,
    required this.onTap,
    required this.actionText,
    this.color = primary,
    this.decoration = TextDecoration.none,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  final Color color;
  final String actionText;
  final TextDecoration decoration;
  final FontWeight fontWeight;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: actionText,
          style: customTextStyle(
            color: color,
            decoration: decoration,
            fontWeight: fontWeight,
          ),
          //! on Tap Function
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ),
    );
  }
}
