part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {
  HomeInitial();
}

final class HomeLoading extends HomeState {
  HomeLoading();
}

final class HomeCompleted extends HomeState {
  final int bottomNavigationIndex;
  final List<AllCharacters>? allCharacters;
  final List<AllCharacters>? staff;
  final List<AllCharacters>? students;
  HomeCompleted(
      {this.bottomNavigationIndex = 0,
      this.allCharacters,
      this.staff,
      this.students});
}

final class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
