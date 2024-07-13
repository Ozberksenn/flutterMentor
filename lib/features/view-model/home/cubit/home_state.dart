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
  HomeCompleted({this.bottomNavigationIndex = 0, this.allCharacters});
}

final class HomeError extends HomeState {
  HomeError();
}
