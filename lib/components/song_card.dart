import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_player/constants.dart';

import '../models/models.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/song', arguments: song);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Image.asset(
                song.coverUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            song.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            song.description,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: kSecondaryColor),
          )
        ],
      ),
    );
  }
}
