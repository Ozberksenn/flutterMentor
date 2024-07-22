import 'package:flutter/material.dart';
import 'widgets/detail_card_content.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DetailCardContent(width: width, height: height);
  }
}
