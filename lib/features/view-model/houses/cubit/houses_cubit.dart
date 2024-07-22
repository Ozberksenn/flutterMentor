import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttermentor/features/model/all_characterse.dart';
import 'package:fluttermentor/product/services/services.dart';
import 'package:meta/meta.dart';

part 'houses_state.dart';

class HousesCubit extends Cubit<HousesState> {
  HousesCubit() : super(HousesInitial());
  final services = AppServices();

  Future<void> fetchCharacterInHouses(String value) async {
    ApiResponse response = await services
        .getData('https://hp-api.onrender.com/api/characters/house/${value}');
    if (response.success) {
      final list =
          response.data.map((item) => AllCharacters.fromJson(item)).toList();
      emit(HousesCompleted(characterInHouses: list));
    } else {}
  }
}
