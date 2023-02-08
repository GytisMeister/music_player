import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/models/models.dart';

class PlaylistAdvertismentCard extends StatelessWidget {
  const PlaylistAdvertismentCard({
    super.key,
    required this.advertisment,
  });

  final Advertisment advertisment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            clipBehavior: Clip.none,
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.19,
            decoration: BoxDecoration(
              color: advertisment.color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  advertisment.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w900),
                ),
                Text(
                  advertisment.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey[700]),
                ),
                SizedBox(height: 10.h),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Positioned(
            right: -40,
            bottom: 0,
            child: Image.asset(
              width: 250,
              height: 200,
              advertisment.url,
            ),
          ),
        ],
      ),
    );
  }
}
