import 'package:flutter/material.dart';

class DoubleTextHeading extends StatelessWidget {
  const DoubleTextHeading({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  final String firstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal),
        ),
        Text(secondText, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
