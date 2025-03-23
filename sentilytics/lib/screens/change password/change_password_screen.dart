import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/auth_provider.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController currentPasswordTextController;
  late TextEditingController newPasswordTextController;
  late GlobalKey<FormState> globalKey;
  @override
  void initState() {
    currentPasswordTextController = TextEditingController();
    newPasswordTextController = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordTextController.dispose();
    newPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AppAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(TextString.profileChangePasswordText)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TextString.currentPasswordLabel,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              AuthTextFormField(
                controller: currentPasswordTextController,
                isEmail: false,
                isPassword: true,
                isName: false,
                prefixIconData: Icons.password,
              ),
              const SizedBox(height: 13),
              Text(
                TextString.newPasswordLabel,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              AuthTextFormField(
                controller: newPasswordTextController,
                isEmail: false,
                isPassword: true,
                isName: false,
                prefixIconData: Icons.password,
              ),
              const SizedBox(height: 13),
              AuthButton(
                text: TextString.changePasswordButtonText,
                onTap: () {
                  if (globalKey.currentState!.validate()) {
                    authProvider.changePassword(
                      currentPasswordTextController.text,
                      newPasswordTextController.text,
                      context,
                    );
                    currentPasswordTextController.clear();
                    newPasswordTextController.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
