import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/auth_provider.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailTextController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AppAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextString.forgotAppBarTitle,
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
                  Center(
                    child: LottieBuilder.network(
                      ImageString.forgotPasswordImagePath,
                      width: 345,
                      height: 355,
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
                  AuthButton(
                    text: TextString.forgotButtonLink,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await authProvider.forgotPasswordEmail(
                            _emailTextController.text,
                            context,
                          );
                          _emailTextController.clear();
                        } catch (e) {
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(
                              message: 'Sending Email Failed : ${e.toString()}',
                            ),
                          );
                        }
                      }
                    },
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
