// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rocket_app/business_logic/cubit/rockets_cubit.dart';
import 'package:rocket_app/constants/strings.dart';
import 'package:rocket_app/data/repositery/rockets_repo.dart';
import 'package:rocket_app/presentation/screens/home_screen.dart';

class AppRouter {
  late RocketsRepo rocketsRepo;
  late RocketsCubit rocketsCubit;

  AppRouter() {
    rocketsRepo = RocketsRepo();
    rocketsCubit = RocketsCubit(rocketsRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => rocketsCubit,
            child: const HomeScreen(),
          ),
        );
    }
  }
}
