import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fluttermentor/features/model/all_characterse.dart';
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
        staff: currentState.staff,
        bottomNavigationIndex: currentIndex,
      ));
    }
  }

  Future<void> fetchAllCharacters() async {
    final responseAllCharacherts =
        await dio.get('https://hp-api.onrender.com/api/characters');
    final responseStaff =
        await dio.get("https://hp-api.onrender.com/api/characters/staff");
    if (responseAllCharacherts.statusCode == 200 ||
        responseStaff.statusCode == 200) {
      List<AllCharacters>? allCharacterList =
          (responseAllCharacherts.data as List)
              .map((item) => AllCharacters.fromJson(item))
              .toList();
      List<AllCharacters>? staffList = (responseStaff.data as List)
          .map((item) => AllCharacters.fromJson(item))
          .toList();
      emit(HomeCompleted(allCharacters: allCharacterList, staff: staffList));
    } else {
      print(responseAllCharacherts.statusMessage);
      print(responseStaff.statusMessage);
    }
  }
}
