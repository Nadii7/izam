import 'dart:io';
import '../Button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/config/themes/theme.dart';
import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/constants/app_strings.dart';

showAlertDialog({
  required context,
  required String titleTxt,
  required String contentTxt,
}) {
  final title = Center(
    child: Text(
      titleTxt,
      style: cupertinoTextStyle(
        context: context,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
  final content = Text(
    contentTxt,
    textAlign: TextAlign.start,
    style: cupertinoTextStyle(
      fontSize: 14,
      context: context,
      fontWeight: FontWeight.w600,
    ),
  );
  final button = Text(
    AppStrings.done,
    style: cupertinoTextStyle(
      fontSize: 14,
      context: context,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).primaryColor,
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
                text: AppStrings.done,
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
            actionsPadding: defaultPadding,
            contentPadding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
            actionsAlignment: MainAxisAlignment.start,
            actions: [
              TextButton(
                child: button,
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
}
