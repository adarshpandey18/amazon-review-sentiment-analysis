import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';

class ChangeNameScreen extends StatefulWidget {
  const ChangeNameScreen({super.key});

  @override
  State<ChangeNameScreen> createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  late TextEditingController newNameTextController;
  late GlobalKey<FormState> globalKey;
  @override
  void initState() {
    newNameTextController = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DbProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(TextString.profileChangeNameText)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.0),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextString.changeNameLabelText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              AuthTextFormField(
                controller: newNameTextController,
                isEmail: false,
                isPassword: false,
                isName: true,
                prefixIconData: Icons.person,
              ),
              const SizedBox(height: 13),
              AuthButton(
                text: TextString.changeNameButton,
                onTap: () {
                  if (globalKey.currentState!.validate()) {
                    dbProvider.changeName(
                      newNameTextController.text,
                      FirebaseAuth.instance.currentUser!.uid,
                      context,
                    );
                    newNameTextController.clear();
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
