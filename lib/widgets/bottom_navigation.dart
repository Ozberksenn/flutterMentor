import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermentor/pages/home/cubit/home_cubit.dart';

class BottomNavigation extends StatelessWidget {
  final HomeCubit state;

  const BottomNavigation({Key? key, required this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          state.changeBottomIndex(value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: "home", icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(
              label: "test", icon: Icon(CupertinoIcons.hourglass)),
          BottomNavigationBarItem(
              label: "test2", icon: Icon(CupertinoIcons.money_dollar))
        ]);
  }
}
