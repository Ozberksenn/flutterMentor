import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermentor/features/model/all_characterse.dart';
import 'package:fluttermentor/features/view-model/houses/cubit/houses_cubit.dart';
import 'package:fluttermentor/product/constants/app_dimensions.dart';
import 'package:fluttermentor/product/constants/app_strings.dart';

class HousesView extends StatefulWidget {
  const HousesView({super.key});

  @override
  State<HousesView> createState() => _HousesViewState();
}

class _HousesViewState extends State<HousesView> with TickerProviderStateMixin {
  TabController? tabController;
  final HousesCubit cubit = HousesCubit();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    // Called once when the widget is created
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Called when a dependency of the State object changes
  }

  @override
  void dispose() {
    // Called when the widget is removed from the widget tree
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return BlocBuilder<HousesCubit, HousesState>(
      builder: (context, state) {
        final houseCubit = BlocProvider.of<HousesCubit>(context);
        if (state is HousesInitial) {
          return const CircularProgressIndicator();
        } else if (state is HousesCompleted) {
          return Padding(
            padding: AppDimensions.pagePadding,
            child: Column(children: [
              TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  onTap: (value) {
                    if (value == 0) {
                      houseCubit.fetchCharacterInHouses("gryffindor");
                    } else if (value == 1) {
                      houseCubit.fetchCharacterInHouses("hufflepuff");
                    } else if (value == 2) {
                      houseCubit.fetchCharacterInHouses("ravenclaw");
                    } else if (value == 3) {
                      houseCubit.fetchCharacterInHouses("slytherin");
                    } else {}
                  },
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: 'Gryffindor',
                    ),
                    Tab(
                      text: 'Hufflepuff',
                    ),
                    Tab(
                      text: 'Ravenclaw',
                    ),
                    Tab(
                      text: 'Slytherin',
                    )
                  ]),
              Expanded(
                child: SizedBox(
                  child: ListView.separated(
                      itemCount: state.characterInHouses?.length ?? 0,
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: HousesCard(state.characterInHouses?[index]),
                        );
                      }),
                ),
              )
            ]),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class HousesCard extends StatelessWidget {
  const HousesCard(
    this.characters, {
    super.key,
  });
  final AllCharacters? characters;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: characters?.image != ""
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          characters?.image ?? AppStrings.customImage))
                  : const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppStrings.customImage)))),
      title: Text(characters?.name ?? ""),
      subtitle: Text(characters?.actor ?? ""),
    );
  }
}
