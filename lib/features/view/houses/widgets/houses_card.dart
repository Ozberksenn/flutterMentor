import 'package:flutter/material.dart';
import 'package:fluttermentor/product/router/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../product/constants/app_strings.dart';
import '../../../model/all_characterse.dart';

class HousesCard extends StatelessWidget {
  const HousesCard(
    this.characters, {
    super.key,
  });
  final AllCharacters? characters;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.goNamed(AppRoutes.detail),
      leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: characters?.image != ""
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          characters?.image ?? AppStrings.customImage))
                  : const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppStrings.customImage)))),
      title: Text(characters?.name ?? ""),
      subtitle: Text(characters?.actor ?? ""),
    );
  }
}
