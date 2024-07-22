import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermentor/features/view/profile/profile_view.dart';
import 'package:fluttermentor/features/widgets/appBar.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 48.0),
            child: ProfileView(),
          ))
        ],
      ),
    );
  }
}
