import 'package:flutter/material.dart';

class MainBar extends StatelessWidget implements PreferredSizeWidget {
  const MainBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'EMI Calculator',
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blueGrey,
      actions: [],
      centerTitle: true

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
