import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermentor/product/constants/app_strings.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            // todo : Alert çıkar ve uygulamadan çıkış yapmak istediğini sor . !!
            print("Back yok ");
          }
        },
        icon: const Icon(CupertinoIcons.back)),
    title: Image.network(
      AppStrings.logo,
      width: 200,
      height: 80,
    ),
  );
}
