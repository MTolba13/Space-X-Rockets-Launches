part of 'rockets_cubit.dart';

@immutable
abstract class RocketsState {}

class RocketsInitial extends RocketsState {}

class NextLaunchAndPastLaunchesLoaded extends RocketsState {
  final dynamic nextLaunchAndPastLaunches;

  NextLaunchAndPastLaunchesLoaded(this.nextLaunchAndPastLaunches);
}
