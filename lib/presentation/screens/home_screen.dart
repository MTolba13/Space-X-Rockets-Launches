import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rocket_app/business_logic/cubit/rockets_cubit.dart';
import 'package:rocket_app/data/models/launches_model.dart';
import 'package:rocket_app/presentation/widgets/past_rocket_item.dart';
import 'package:rocket_app/utils/date_formatter.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> passtLaunchesList;
  late List<dynamic> upcomingLaunchesList;

  @override
  void initState() {
    super.initState();
    emitNextLaunchAndPastLaunches(context);
  }

  void emitNextLaunchAndPastLaunches(context) {
    BlocProvider.of<RocketsCubit>(context).emitNextlauncheAndPastLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Padding(
          padding: EdgeInsets.all(16.0),
          child: FaIcon(FontAwesomeIcons.rocket),
        ),
        title: const Text('Space X Rockets'),
        actions: [buildFilterIcon(context)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                const Center(
                  child: Text(
                    'Next Launch will be in :',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                buildNextLaunchAndPastLaunchesBloc(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNextLaunchAndPastLaunchesBloc() {
    return BlocBuilder<RocketsCubit, RocketsState>(
      builder: (context, state) {
        if (state is NextLaunchAndPastLaunchesLoaded) {
          upcomingLaunchesList = (state).nextLaunchAndPastLaunches[0];
          passtLaunchesList = (state).nextLaunchAndPastLaunches[1];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildNextLaunchCountDownTimer(),
              const SizedBox(
                height: 14,
              ),
              buildPastRocketsListView()
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  buildNextLaunchCountDownTimer() {
    // تاريخ النهارده
    DateTime currentDate = DateTime.now();
    // ده الاوبجيكت كله بتاع اللانش اللي جاي
    LaunchesModel nextLaunch =
        upcomingLaunchesList.firstWhere((upcomingLaunch) {
      return DateTime.parse(upcomingLaunch.launchDate!).isAfter(currentDate);
    });
    // انا عايز ايه ؟؟؟
    // عايز تاريخ اللانش اللي جاي
    // واجيب الفرق بينه وبين تاريخ النهارده واعرضه

    DateTime nextLaunchDate = DateTime.parse(nextLaunch.launchDate!);

    int differencesInTimeInSeconds =
        DateFormatter.calculateTimeBetweenTwoDates(currentDate, nextLaunchDate);

    return Builder(
      builder: (context) {
        return Card(
          elevation: 10,
          color: Colors.black,
          child: SlideCountdown(
            curve: Curves.easeInQuad,
            duration: Duration(seconds: differencesInTimeInSeconds),
            slideDirection: SlideDirection.down,
            separatorType: SeparatorType.title,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            separatorPadding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Colors.black),
          ),
        );
      },
    );
  }

  Widget buildPastRocketsListView() {
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: passtLaunchesList.length,
      itemBuilder: (ctx, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Card(
            color: Colors.white,
            child: PastRocketItem(
              pastLaunches: passtLaunchesList[index],
            ),
          ),
        );
      },
    );
  }

  buildFilterIcon(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.filter_alt_rounded),
      iconSize: 26,
    );
  }
}
