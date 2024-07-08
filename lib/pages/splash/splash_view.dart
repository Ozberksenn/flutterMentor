import 'package:flutter/material.dart';

class SplasView extends StatelessWidget {
  const SplasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: const Text('Go To Home'))
        ],
      ),
    );
  }
}
