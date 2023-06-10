import 'package:flutter/cupertino.dart';
import '../Dialogs/loading_widget.dart';
import '../../../../core/config/themes/theme.dart';
import '../../../../core/utils/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final Color color, textColor;
  final double radius, fontSize;
  final String text;
  final Function() onPress;
  final FontWeight fontWeight;
  final bool isDisabled, isLoading;

  const CustomButton({
    super.key,
    this.color = primary,
    this.textColor = primaryBackground,
    this.radius = 5.0,
    this.fontSize = 16,
    required this.text,
    required this.onPress,
    this.fontWeight = FontWeight.w600,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      disabledColor: color.withOpacity(0.5),
      onPressed: isDisabled ? null : onPress,
      borderRadius: BorderRadius.circular(radius),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: isLoading
          ? const LoadingWidget()
          : Text(
              text,
              style: cupertinoTextStyle(
                context: context,
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
    );
  }
}
