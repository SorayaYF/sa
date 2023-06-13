import 'package:flutter/material.dart';

class Carrossel extends StatelessWidget {
  final IconData icon;
  final String text;

  const Carrossel({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 8.0),
        Text(text),
      ],
    );
  }
}