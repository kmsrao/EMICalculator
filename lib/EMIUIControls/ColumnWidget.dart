import 'package:flutter/material.dart';
import 'TextfieldWidget.dart';
import 'Slider.dart'; // Assuming the file name is EMISlider.dart

class ColumnWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final int maxLength;
  final double min;
  final double max;

  const ColumnWidget({
    super.key,
    required this.labelText,
    required this.controller,
    required this.maxLength,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextfieldWidget(labelText: labelText, controller: controller , maxLength: maxLength),
            Silder(controller: controller, min: min, max: max)
          ],
        ),
      ),
    );
  }
}
