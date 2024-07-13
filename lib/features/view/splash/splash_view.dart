import 'package:flutter/material.dart';
import 'package:fluttermentor/product/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class SplasView extends StatelessWidget {
  const SplasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                context.goNamed(AppRoutes.home);
              },
              child: const Text('Go To Home'))
        ],
      ),
    );
  }
}
