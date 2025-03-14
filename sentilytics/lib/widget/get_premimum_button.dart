import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetPremimumButton extends StatelessWidget {
  const GetPremimumButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Get Premimum'),
      onPressed: () {
        onTap;
      },
    );
  }
}
