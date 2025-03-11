import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,
    required this.url,
    required this.buttonText,
    required this.onTap,
  });

  final String url;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Lottie.network(url, width: 28, height: 28, repeat: true),
        label: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 19),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(17.6),
          ),
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
