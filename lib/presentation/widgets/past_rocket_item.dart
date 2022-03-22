import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rocket_app/data/models/launches_model.dart';
import 'package:rocket_app/utils/date_formatter.dart';

class PastRocketItem extends StatelessWidget {
  final LaunchesModel pastLaunches;

  const PastRocketItem({Key? key, required this.pastLaunches})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormatter.formatStringDate(
      'yyyy-MM-ddTHH:mm:ssZ',
      pastLaunches.launchDate!,
      'dd/MM/yyyy hh:mm a',
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.all(2),
      padding: const EdgeInsetsDirectional.all(8),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: Container(
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: CachedNetworkImage(
              imageUrl: pastLaunches.links!.patch.largeImage == null
                  ? ""
                  : pastLaunches.links!.patch.largeImage!,
              placeholder: (context, _) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
              errorWidget: (context, _, error) => const Icon(
                Icons.timelapse,
                color: Colors.black,
              ),
            ),
          ),
          title: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${pastLaunches.name}',
                  style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 4,
                ),
                //Text(data)
              ],
            ),
          ),
          subtitle: Text(
            formattedDate,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
