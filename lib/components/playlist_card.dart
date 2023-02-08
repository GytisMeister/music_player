import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../models/models.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playlists,
  });

  final Playlist playlists;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          playlists.coverUrl,
          height: 100,
          width: 70,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(playlists.title),
      subtitle: Row(
        children: [
          Text(
            'By',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: kSecondaryColor),
          ),
          SizedBox(width: 4.w),
          Text(
            playlists.creator,
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          SizedBox(width: 15.w),
          Text(
            '${playlists.numberSongs} Songs',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: kSecondaryColor),
          ),
        ],
      ),
      trailing: playlists.isDownLoaded
          ? const Icon(
              Icons.check,
              color: kAccentColor,
            )
          : const Icon(
              Icons.download,
              color: kPrimaryColor,
            ),
    );
  }
}
