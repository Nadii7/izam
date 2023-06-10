import 'package:flutter/material.dart';
import '../../../../Widgets/Button/custom_button.dart';
import '../../../../widgets/Text/custom_mail_field.dart';
import '../../../../../../core/config/themes/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/constants/constants.dart';
import '../../../../../../core/utils/extensions/extensions.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController mailController = TextEditingController();
  bool _isDisabled = true;
  final bool _isLoading = false;

  void checkInputFields() {
    if (mailController.text.trim().isEmpty ||
        mailController.text.isEmail == false) {
      setState(() => _isDisabled = true);
    } else {
      setState(() => _isDisabled = false);
    }
  }

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  // Future<void> _forgotPassword(context) async {
  //   //! disable button
  //   setState(() {
  //     _isLoading = true;
  //     _isDisabled = true;
  //   });
  //   // ! request data
  //   await Provider.of<AuthRepository>(context, listen: false)
  //       .forgotPassword(
  //     context: context,
  //     email: phoneController.text.trim(),
  //     lang: Provider.of<LanguageProvider>(context, listen: false).lang,
  //   )
  //       .then(
  //     (value) {
  //       if (value != null) showCustomSnack(context, value);
  //     },
  //   );
  //   setState(() {
  //     _isLoading = false;
  //     _isDisabled = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "oops you forgot your password!",
              style: customTextStyle(
                height: 1.2,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).hintColor,
              ),
            ),
            SizedBox(height: 20.h),
            CustomMailInputField(
              controller: mailController,
              onChanged: (value) => checkInputFields(),
            ),
            SizedBox(height: 10.h),
            CustomButton(
              text: "send",
              isDisabled: _isDisabled,
              isLoading: _isLoading,
              onPress: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
