import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailTextController;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextString.forgotAppBarTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Form(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      ImageString.forgotPasswordImagePath,
                      width: 245,
                      height: 255,
                    ),
                  ),
                  const SizedBox(height: 72),
                  Text(
                    TextString.passwordScreenText,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 17),
                  Text(
                    TextString.emailLabelText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 9.2),
                  AuthTextFormField(
                    controller: _emailTextController,
                    isEmail: true,
                    isName: false,
                    isPassword: false,
                    prefixIconData: Icons.email_rounded,
                  ),
                  const SizedBox(height: 13),
                  AuthButton(text: TextString.forgotButtonLink, onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
