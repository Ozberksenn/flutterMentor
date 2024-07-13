import 'package:flutter/material.dart';
import 'package:fluttermentor/product/constants/app_strings.dart';

AppBar appBar() {
  return AppBar(
    title: Image.network(
      AppStrings.logo,
      width: 200,
      height: 80,
    ),
  );
}
