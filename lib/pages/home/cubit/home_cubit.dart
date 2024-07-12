import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/physics.dart';
import 'package:fluttermentor/model/all_characterse.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final dio = Dio();

  void changeBottomIndex(int currentIndex) {
    if (state is HomeCompleted) {
      final currentState = state as HomeCompleted;
      emit(HomeCompleted(
        allCharacters: currentState.allCharacters,
        bottomNavigationIndex: currentIndex,
      ));
    }
  }

  Future<void> fetchAllCharacters() async {
    emit(HomeInitial());
    final response =
        await dio.get('https://hp-api.onrender.com/api/characters');
    if (response.statusCode == 200) {
      List<AllCharacters>? allCharacterList = (response.data as List)
          .map((item) => AllCharacters.fromJson(item))
          .toList();
      emit(HomeCompleted(allCharacters: allCharacterList));
    } else {
      print(response.statusMessage);
    }
  }
}
