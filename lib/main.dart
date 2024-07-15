import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        ],
        child: MaterialApp.router(
            title: 'Harry Potter',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: router));
  }
}
