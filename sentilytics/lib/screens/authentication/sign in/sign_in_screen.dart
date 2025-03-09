import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/screens/authentication/forgot%20password/forgot_password_screen.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_rich_text.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';
import 'package:sentilytics/widget/image_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextString.signInAppBarTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email Field
                  Text(
                    TextString.emailLabelText,
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
                  const SizedBox(height: 18),

                  // Password Field
                  Text(
                    TextString.passwordLabelText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 9.2),
                  AuthTextFormField(
                    controller: _passwordTextController,
                    isEmail: false,
                    isName: false,
                    isPassword: true,
                    prefixIconData: Icons.lock,
                  ),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(TextString.forgotPasswordText),
                    ),
                  ),
                  const SizedBox(height: 13),
                    AuthButton(text: TextString.signInButtonText, onTap: () {}),
                  const SizedBox(height: 13),
                  AuthRichText(
                    firstText: 'Don\'t have an account? ',
                    secondText: 'Sign Up',
                    onTap: () {},
                  ),
                  const SizedBox(height: 9.2),
                  Center(
                    child: Text(
                      'or',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 9.2),
                  ImageButton(
                    url:
                        'https://lottie.host/cfffb058-85b8-416e-a013-25aa3aac1bc4/YwfUfhX0dP.json',
                    buttonText: TextString.googleButtonText,
                    onTap: () {},
                  ),
                  const SizedBox(height: 13),
                  ImageButton(
                    url:
                        'https://lottie.host/7f379b45-9c9e-45e4-a062-fb5309f1efe1/ret9wd4ka9.json',
                    buttonText: TextString.googleButtonText,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
