import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/auth_provider.dart';
import 'package:sentilytics/routes/app_router_constant.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_rich_text.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';
import 'package:sentilytics/widget/image_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
    final authProvider = Provider.of<AppAuthProvider>(context);
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
              child: Stack(
                children: [
                  Column(
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
                            context.go(
                              AppRouterConstant.signInRoutePath +
                                  AppRouterConstant.forgotPasswordRoutePath,
                            );
                          },
                          child: Text(TextString.forgotPasswordText),
                        ),
                      ),
                      const SizedBox(height: 13),
                      AuthButton(
                        text: TextString.signInButtonText,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              authProvider.signInWithEmail(
                                _emailTextController.text,
                                _passwordTextController.text,
                                context,
                              );
                              _emailTextController.clear();
                              _passwordTextController.clear();
                            } catch (e) {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  message: 'Sign In : ${e.toString()}',
                                ),
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 13),
                      AuthRichText(
                        firstText: TextString.signInFirstRichText,
                        secondText: TextString.signInSecondRichText,
                        onTap:
                            () => context.go(AppRouterConstant.signUpRoutePath),
                      ),
                      const SizedBox(height: 9.2),
                      Center(
                        child: Text(
                          'or',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 9.2),
                      ImageButton(
                        url: ImageString.googleButtonImageLink,
                        buttonText: TextString.googleButtonText,
                        onTap: () {},
                      ),
                      const SizedBox(height: 13),
                      ImageButton(
                        url: ImageString.facebookButtonImageLink,
                        buttonText: TextString.facebookButtonText,
                        onTap: () {},
                      ),
                    ],
                  ),
                  if (authProvider.isLoading) CupertinoActivityIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
