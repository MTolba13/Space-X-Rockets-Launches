import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rocket_app/data/repositery/rockets_repo.dart';

part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final RocketsRepo rocketsRepo;
  RocketsCubit(this.rocketsRepo) : super(RocketsInitial());

  void emitNextlauncheAndPastLaunches() {
    rocketsRepo.getNextLauncheAndPastLaunches().then(
      (data) {
        emit(NextLaunchAndPastLaunchesLoaded(data));
      },
    );
  }
}
