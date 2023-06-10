import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle customTextStyle({
  double height = 1,
  double fontSize = 14.0,
  Color color = secondaryText,
  double letterSpacing = 0.0,
  FontWeight fontWeight = FontWeight.w400,
  TextDecoration decoration = TextDecoration.none,
}) {
  return TextStyle(
    color: color,
    height: height.h,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    decoration: decoration,
    letterSpacing: letterSpacing,
  );
}

TextStyle cupertinoTextStyle({
  double? height,
  String? fontFamily,
  Color color = secondaryText,
  double fontSize = 16.0,
  required BuildContext context,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return TextStyle(
      color: color,
      height: height ?? 1.h,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: 'GoogleRegular');
}

AppBarTheme appBarTheme({
  double elevation = 0.0,
  bool centerTitle = true,
  required BuildContext context,
  Color iconColor = primaryBackground,
  Color textColor = primaryBackground,
}) {
  return AppBarTheme(
    color: primary,
    elevation: elevation,
    centerTitle: centerTitle,
    iconTheme: IconThemeData(color: iconColor),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      fontSize: 16.h,
      color: textColor,
      letterSpacing: 0.0,
      fontWeight: FontWeight.w600,
    ),
  );
}

ThemeData defaultThemeData(context) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: primary,
    hintColor: secondaryText,
    dividerColor: secondaryText,
    cardColor: secondaryBackground,
    splashColor: primaryBackground,
    hoverColor: primary.withOpacity(0.5),
    appBarTheme: appBarTheme(context: context),
    scaffoldBackgroundColor: primaryBackground,
    disabledColor: CupertinoColors.systemGrey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerTheme: const DividerThemeData(color: CupertinoColors.systemGrey3),
    cardTheme: const CardTheme(
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: secondaryBackground,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          error: error,
          primary: primary,
          secondary: secondary,
          outline: secondaryText,
          background: secondaryBackground,
        ),
  );
}

InputDecoration textFieldDecoration() {
  return InputDecoration(
    filled: true,
    isDense: true,
    counterText: '',
    fillColor: primaryBackground,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        color: primaryBackground,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: primary,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: alternate,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: alternate,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

BoxDecoration cardDecoration() {
  return BoxDecoration(
    shape: BoxShape.rectangle,
    color: secondaryBackground,
    borderRadius: BorderRadius.circular(20.h),
    border: Border.all(color: primaryBackground),
    boxShadow: const [
      BoxShadow(
        blurRadius: 15.0,
        color: Color(0x3416202A),
        offset: Offset(0.0, 2.0),
      )
    ],
  );
}
