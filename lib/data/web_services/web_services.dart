// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:rocket_app/constants/strings.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: rocketsBaseUrl,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getNextLauncheAndPastLaunches() async {
    try {
      var responses = await Future.wait([
        dio.get('launches/upcoming'),
        dio.get('launches/past'),
      ]);
      print(responses[0].data.toString());
      print(responses[1].data.toString());
      return [responses[0].data, responses[1].data];
    } catch (e) {
      return Future.error("this is stack trace ");
    }
  }
}
