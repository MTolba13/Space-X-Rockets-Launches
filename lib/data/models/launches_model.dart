class LaunchesModel {
  late String? id;
  late String? name;
  late String? utcDate;
  late String? launchDate;
  late Links? links;
  late bool? didRocketSuccessed;
  late String rocketId;
  late String launchpadId;
  late String payloadsId;

  LaunchesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    utcDate = json['date_utc'];
    launchDate = json['date_local'];
    links = Links.fromJson(json['links']);
    didRocketSuccessed = json['success'];
    rocketId = json['rocket'];
    launchpadId = json['launchpad'];
    payloadsId = json['payloads'][0];
  }
}

class Links {
  late Patch patch;
  late String? launchingLink;

  Links.fromJson(Map<String, dynamic> json) {
    patch = Patch.fromJson(json['patch']);
    launchingLink = json['webcast'];
  }
}

class Patch {
  late String? smallImage;
  late String? largeImage;

  Patch.fromJson(Map<String, dynamic> json) {
    smallImage = json['small'];
    largeImage = json['large'];
  }
}
