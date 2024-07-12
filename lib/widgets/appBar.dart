import 'package:flutter/material.dart';
import '../utils/path.dart';

AppBar appBar() {
  return AppBar(
    title: Image.network(
      AssetPath.logo,
      width: 200,
      height: 80,
    ),
  );
}
