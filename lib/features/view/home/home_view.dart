import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermentor/product/constants/app_dimensions.dart';
import 'package:fluttermentor/product/utils/state_functions.dart';
import '../../view-model/home/cubit/home_cubit.dart';
import '../../widgets/appBar.dart';
import '../../widgets/bottom_navigation.dart';
import 'widgets/home_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeInitial) {
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
            homeCompleted: state,
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
    return SingleChildScrollView(
      child: Padding(
        padding: AppDimensions.pagePadding,
        child: Column(
          children: [
            HomeCard(
              title: "All Characters",
              list: state.allCharacters ?? [],
            ),
            const Padding(
              padding: AppDimensions.padding8,
              child: Divider(),
            ),
            HomeCard(title: "Hogwarts Staff", list: state.staff ?? []),
            const Padding(
              padding: AppDimensions.padding8,
              child: Divider(),
            ),
            HomeCard(title: "Hogwarts Students", list: state.students ?? []),
          ],
        ),
      ),
    );
  }
}
