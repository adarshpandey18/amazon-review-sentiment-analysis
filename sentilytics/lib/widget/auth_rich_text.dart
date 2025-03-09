import 'package:flutter/material.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });
  final String firstText;
  final String secondText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            text: firstText,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
            children: [
              TextSpan(
                text: secondText,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
