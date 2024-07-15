import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view-model/home/cubit/home_cubit.dart';

class BottomNavigation extends StatelessWidget {
  final HomeCubit state;
  final HomeCompleted homeCompleted;

  const BottomNavigation(
      {Key? key, required this.state, required this.homeCompleted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: homeCompleted.bottomNavigationIndex,
        onTap: (value) {
          state.changeBottomIndex(value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: "home", icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(
              label: "test", icon: Icon(CupertinoIcons.hourglass)),
          BottomNavigationBarItem(
              label: "Profile", icon: Icon(CupertinoIcons.person_fill))
        ]);
  }
}
