import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermentor/product/utils/state_functions.dart';
import '../../view-model/home/cubit/home_cubit.dart';
import '../../widgets/appBar.dart';
import '../../widgets/bottom_navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeInitial) {
        homeCubit.fetchAllCharacters();
        return Scaffold(
          appBar: appBar(),
        );
      } else if (state is HomeLoading) {
        return const CircularProgressIndicator();
      } else if (state is HomeCompleted) {
        return Scaffold(
          appBar: appBar(),
          body: homeBottomContent(state),
          bottomNavigationBar: BottomNavigation(
            state: homeCubit,
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}

class Home extends StatelessWidget {
  final HomeCompleted state;
  const Home({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height / 5,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.allCharacters?.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  Text(state.allCharacters?[index].name ?? ""),
                  Container()
                ]);
              }),
        ),
      ],
    );
  }
}
