import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fluttermentor/features/model/all_characterse.dart';
import 'package:fluttermentor/product/services/services.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final services = AppServices();
  HomeCubit() : super(HomeInitial());

  final dio = Dio();

  void changeBottomIndex(int currentIndex) {
    if (state is HomeCompleted) {
      final currentState = state as HomeCompleted;
      emit(HomeCompleted(
        allCharacters: currentState.allCharacters,
        staff: currentState.staff,
        students: currentState.students,
        bottomNavigationIndex: currentIndex,
      ));
    }
  }

  Future<void> fetchData() async {
    final staff = await fetchStaff();
    final allCharacters = await fetchAllCharacters();
    final students = await fetchStudents();
    emit(HomeCompleted(
        allCharacters: allCharacters, staff: staff, students: students));
  }

  Future<List<AllCharacters>> fetchStaff() async {
    ApiResponse response = await services
        .getData("https://hp-api.onrender.com/api/characters/staff");
    if (response.success) {
      return response.data.map((item) => AllCharacters.fromJson(item)).toList();
    } else {
      return [];
    }
    // final response =
    //     await dio.get("https://hp-api.onrender.com/api/characters/staff");
    // if (response.statusCode == 200) {
    // return (response.data as List)
    //     .map((item) => AllCharacters.fromJson(item))
    //     .toList();
    // } else {
    //   return [];
    // }
  }

  Future<List<AllCharacters>> fetchAllCharacters() async {
    ApiResponse response =
        await services.getData("https://hp-api.onrender.com/api/characters");
    if (response.success) {
      return response.data.map((e) => AllCharacters.fromJson(e)).toList();
    } else {
      return [];
    }
    // final responseAllCharacherts =
    //     await dio.get('https://hp-api.onrender.com/api/characters');
    // if (responseAllCharacherts.statusCode == 200) {
    //   return (responseAllCharacherts.data as List)
    //       .map((item) => AllCharacters.fromJson(item))
    //       .toList();
    // } else {
    //   return [];
    // }
  }

  Future<List<AllCharacters>> fetchStudents() async {
    ApiResponse response = await services
        .getData("https://hp-api.onrender.com/api/characters/students");
    if (response.success) {
      return response.data.map((e) => AllCharacters.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
