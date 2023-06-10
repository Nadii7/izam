import 'package:flutter/material.dart';
import 'package:izam/core/config/themes/theme.dart';
import '../../../../core/utils/constants/constants.dart';

showCustomSnack(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 5.0,
      margin: defaultPadding,
      padding: defaultPadding,
      clipBehavior: Clip.antiAlias,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 3000),
      dismissDirection: DismissDirection.down,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: cupertinoTextStyle(
          fontSize: 12,
          context: context,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    ),
  );
}
