import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/text_string.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text(TextString.changeNameLabelText)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.0),
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
                  newNameTextController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
