import 'dart:io';
import '../../../../core/config/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Button/custom_button.dart';

showAlertDialog(BuildContext context, String text) {
  final title = Center(
    child: Text(
      'alert',
      style: cupertinoTextStyle(
        context: context,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  final content = Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: cupertinoTextStyle(
        fontSize: 14,
        context: context,
        fontWeight: FontWeight.w600,
      ),
    ),
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
      ? showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: title,
            content: content,
            insetAnimationDuration: const Duration(seconds: 2),
            actions: [
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
            title: title,
            content: content,
            actionsAlignment: MainAxisAlignment.start,
            contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
            actions: [
              TextButton(
                child: button,
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
}
