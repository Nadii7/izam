import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/config/themes/theme.dart';
import '../Button/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showErrorDialog({
  required BuildContext context,
  required String message,
  String? title,
}) {
  final titleWidget = Center(
    child: Text(
      "error",
      style: cupertinoTextStyle(
        context: context,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.error,
      ),
    ),
  );
  final contentWidget = Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      title != null
          ? Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 15.w,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Text(
                title,
                style: cupertinoTextStyle(
                  fontSize: 14,
                  context: context,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            )
          : const SizedBox(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          message,
          style: cupertinoTextStyle(
            context: context,
            fontSize: 14,
          ),
        ),
      ),
    ],
  );
  final button = Text(
    'cancel',
    style: cupertinoTextStyle(
      fontSize: 14,
      context: context,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.error,
    ),
  );
  return Platform.isIOS
      ? showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => CupertinoAlertDialog(
            title: titleWidget,
            content: contentWidget,
            actions: <Widget>[
              CustomButton(
                text: 'cancel',
                onPress: () => Navigator.pop(context),
              ),
            ],
          ),
        )
      : showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: titleWidget,
            content: contentWidget,
            actionsAlignment: MainAxisAlignment.start,
            contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
            actions: [
              TextButton(
                child: button,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
}
