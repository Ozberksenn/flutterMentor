part of 'houses_cubit.dart';

@immutable
sealed class HousesState {}

final class HousesInitial extends HousesState {
  HousesInitial();
}

final class HousesLoading extends HousesState {}

final class HousesCompleted extends HousesState {
  final List<AllCharacters>? characterInHouses;

  HousesCompleted({this.characterInHouses});
}

final class HousesError extends HousesState {
  final String message;
  HousesError({required this.message});
}
