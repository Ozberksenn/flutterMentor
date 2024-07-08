import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermentor/home/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, int>(
        builder: (context, state) {
          return Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    homeCubit.increment();
                  },
                  child: const Text('Increment')),
              Text(homeCubit.state.toString()),
              ElevatedButton(
                  onPressed: () {
                    homeCubit.decrement();
                  },
                  child: const Text('Decrement')),
            ],
          );
        },
      ),
    );
  }
}
