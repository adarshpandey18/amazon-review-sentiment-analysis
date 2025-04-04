import 'package:flutter/material.dart';

class GetPremiumButton extends StatelessWidget {
  const GetPremiumButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        Icons.workspace_premium_rounded,
        color: Theme.of(context).colorScheme.secondary,
      ),
      label: Text('Get Premium'),
      onPressed: onTap,
    );
  }
}
