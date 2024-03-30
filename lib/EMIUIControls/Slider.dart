import 'package:flutter/material.dart';

class Silder extends StatefulWidget {
  final TextEditingController controller;
  final double min;
  final double max;

  const Silder({
    Key? key,
    required this.controller,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  SilderState createState() => SilderState();
}

class SilderState extends State<Silder> {
  double homeLoanAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slider(
          value: homeLoanAmount,
          min: widget.min,
          max: widget.max,
          onChanged: (newValue) {
            setState(() {
              homeLoanAmount = newValue;
              widget.controller.text = newValue.toStringAsFixed(0);
            });
          },
          activeColor: Colors.white, // Set properties here
          inactiveColor: Colors.blueGrey,
          thumbColor: Colors.green,
        ),
      ],
    );
  }
}
