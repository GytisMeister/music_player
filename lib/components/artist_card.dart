import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/constants.dart';

import '../models/artist_model.dart';

class ArtistAvatar extends StatelessWidget {
  const ArtistAvatar({
    super.key,
    required this.artists,
  });

  final Artist artists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.sp,
          backgroundImage: AssetImage(artists.url),
        ),
        SizedBox(height: 10.h),
        Text(
          artists.name,
          style: const TextStyle(color: kSecondaryColor),
        ),
      ],
    );
  }
}
