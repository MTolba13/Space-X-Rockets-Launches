import 'package:rocket_app/data/models/launches_model.dart';
import 'package:rocket_app/data/web_services/web_services.dart';

class RocketsRepo {
  late WebServices webServices;
  RocketsRepo() {
    webServices = WebServices();
  }

  Future<List<dynamic>> getNextLauncheAndPastLaunches() async {
    var responses = await webServices.getNextLauncheAndPastLaunches();

    var listOfPastLaunches = responses[0];
    var listOfUpcomingaunches = responses[1];

    return [
      // LaunchesModel.fromJson(responses[0]),
      listOfPastLaunches
          .map((pastLaunches) => LaunchesModel.fromJson(pastLaunches))
          .toList(),

      listOfUpcomingaunches
          .map((upcomingLaunches) => LaunchesModel.fromJson(upcomingLaunches))
          .toList()
    ];
  }
}
