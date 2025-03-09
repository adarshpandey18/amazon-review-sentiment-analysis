import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.isEmail,
    required this.isPassword,
    required this.isName,
    required this.prefixIconData,
  });

  final TextEditingController controller;
  final bool isEmail;
  final bool isPassword;
  final bool isName;
  final IconData prefixIconData;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: widget.controller,
      keyboardType:
          widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
      cursorOpacityAnimates: true,
      obscureText: widget.isPassword ? !showPassword : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 21),
        prefixIcon: Icon(widget.prefixIconData, size: 24),

        suffixIcon:
            widget.isPassword
                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    size: 24,
                  ),
                )
                : null, //
      ),
    );
  }
}
