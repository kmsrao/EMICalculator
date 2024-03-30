import 'package:flutter/material.dart';
import 'EMIUIControls/EMIScreen.dart';

class MainUI extends StatelessWidget {
  const MainUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EMIScreen(),
    );
  }
}