import 'package:flutter/material.dart';
import '../../../../core/config/themes/theme.dart';
import '../../../../core/utils/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPasswordInputField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const CustomPasswordInputField({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomPasswordInputField> createState() =>
      _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      obscureText: _isHidden,
      onChanged: widget.onChanged,
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      strutStyle: const StrutStyle(forceStrutHeight: true),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: textFieldDecoration().copyWith(
        labelText: 'Password',
        suffixIcon: InkWell(
          focusNode: FocusNode(skipTraversal: true),
          onTap: () => setState(() => _isHidden = !_isHidden),
          child: Icon(
            _isHidden
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 20.h,
            color: secondaryText,
          ),
        ),
      ),
    );
  }
}
