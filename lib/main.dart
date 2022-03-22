import 'package:flutter/material.dart';

import 'package:rocket_app/utils/app_router.dart';

void main() {
  runApp(RocketsApp(
    appRouter: AppRouter(),
  ));
}

class RocketsApp extends StatelessWidget {
  final AppRouter appRouter;

  const RocketsApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
