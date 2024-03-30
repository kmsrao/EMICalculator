import 'package:flutter/material.dart';
import 'MainBar.dart';
import 'EMIWidget.dart';

class EMIScreen extends StatelessWidget {
  const EMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainBar(),
      body: EMIWidget(),
    );
  }
}
