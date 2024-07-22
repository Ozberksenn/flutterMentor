import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermentor/features/view-model/houses/cubit/houses_cubit.dart';
import 'package:fluttermentor/product/theme/theme.dart';
import 'features/view-model/home/cubit/home_cubit.dart';
import 'product/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) {
            final homeCubit = HomeCubit();
            homeCubit.fetchData();
            return homeCubit;
          }),
          BlocProvider(create: (_) {
            final housesCubit = HousesCubit()
              ..fetchCharacterInHouses("gryffindor");
            return housesCubit;
          }),
        ],
        child: MaterialApp.router(
            title: 'Harry Potter',
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: router));
  }
}
