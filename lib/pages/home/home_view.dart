import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermentor/pages/home/cubit/home_cubit.dart';
import 'package:fluttermentor/pages/profile/profile_view.dart';
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
          body: bottomContent(state),
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
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.allCharacters?.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Text(state.allCharacters?[index].name ?? ""),
            Container()
          ]);
        });
  }
}

bottomContent(HomeCompleted state) {
  if (state.bottomNavigationIndex == 0) {
    return Home(
      state: state,
    );
  } else if (state.bottomNavigationIndex == 1) {
    return Container(
      child: Text('Other'),
    );
  } else if (state.bottomNavigationIndex == 2) {
    return const ProfileView();
  }
}
