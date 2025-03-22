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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _rePasswordTextController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _rePasswordTextController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _rePasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AppAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextString.signUpAppBarTitle,
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
                      // Name Field
                      Text(
                        TextString.nameLabelText,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 9.2),
                      AuthTextFormField(
                        controller: _nameTextController,
                        isEmail: false,
                        isName: true,
                        isPassword: false,
                        prefixIconData: Icons.person,
                      ),
                      const SizedBox(height: 18),

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
                      const SizedBox(height: 18),
                      //Re Password Field
                      Text(
                        TextString.reEnterPasswordLabelText,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 9.2),
                      AuthTextFormField(
                        controller: _rePasswordTextController,
                        isEmail: false,
                        isName: false,
                        isPassword: true,
                        prefixIconData: Icons.lock,
                      ),
                      const SizedBox(height: 13),
                      AuthButton(
                        text: TextString.signUpButtonText,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            try {
                              if (_passwordTextController.text !=
                                  _rePasswordTextController.text) {
                                showTopSnackBar(
                                  Overlay.of(context),
                                  CustomSnackBar.info(
                                    message: 'Password are not same',
                                  ),
                                );
                              } else {
                                authProvider.signUpWithEmail(
                                  _nameTextController.text,
                                  _emailTextController.text,
                                  _passwordTextController.text,
                                  context,
                                );
                                _nameTextController.text;
                                _emailTextController.text;
                                _passwordTextController.text;
                                _rePasswordTextController;
                              }
                            } catch (e) {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  message: 'Sign Up Failed : ${e.toString()}',
                                ),
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 13),
                      AuthRichText(
                        firstText: TextString.signUpFirstRichText,
                        secondText: TextString.signUpSecondRichText,
                        onTap: () {
                          context.go(AppRouterConstant.signInRoutePath);
                        },
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
                        imagePath: ImageString.googleButtonImageLink,
                        buttonText: TextString.googleButtonText,
                        onTap: () {
                          authProvider.signInWithGoogle(context);
                        },
                      ),
                      const SizedBox(height: 13),
                      ImageButton(
                        imagePath: ImageString.facebookButtonImageLink,
                        buttonText: TextString.facebookButtonText,
                        onTap: () {},
                      ),
                    ],
                  ),
                  if (authProvider.isLoading)
                    Center(child: CupertinoActivityIndicator()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
