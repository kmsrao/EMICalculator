import 'package:flutter/material.dart';


class ResultWidget extends StatelessWidget {
  final String label;
  final String value;

  const ResultWidget({super.key, required this.label, required this.value,});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 21,color: Colors.white),
        ),
      ],
    );
  }
  }