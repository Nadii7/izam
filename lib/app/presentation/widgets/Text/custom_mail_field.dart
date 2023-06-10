import 'package:flutter/material.dart';
import '../../../../core/config/themes/theme.dart';
import '../../../../core/utils/extensions/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMailInputField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;

  const CustomMailInputField({
    Key? key,
    this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 16,
      autofocus: true,
      onChanged: onChanged,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      strutStyle: const StrutStyle(forceStrutHeight: true),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: textFieldDecoration().copyWith(
        labelText: 'E-mail',
        suffixIcon: (controller.text.trim().isEmail)
            ? Icon(
                Icons.check,
                size: 20.h,
                color: Theme.of(context).primaryColor,
              )
            : SizedBox(),
      ),
    );
  }
}
