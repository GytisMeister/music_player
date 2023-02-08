import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/components/components.dart';

import '../constants.dart';
import '../models/models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Playlist> playlists = Playlist.playlists;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kScaffold,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
        ),
      ),
      body: Column(
        children: [
          const ProfileHeader(),
          SizedBox(height: 10.h),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
          const _ProfileStatistic(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
          _Playlist(playlists: playlists)
        ],
      ),
    );
  }
}

class _Playlist extends StatelessWidget {
  const _Playlist({
    required this.playlists,
  });

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: SectionHeader(title: 'Top Daily Playlists'),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                return PlaylistCard(
                  playlists: playlists[index],
                );
              })
        ],
      ),
    );
  }
}

class _ProfileStatistic extends StatelessWidget {
  const _ProfileStatistic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: _SongStatistic(
            amount: '700',
            title: 'Fav Song',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: _SongStatistic(
            amount: '18,5k',
            title: 'Followers',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: _SongStatistic(
            amount: '5,7k',
            title: 'Fallowing',
          ),
        )
      ],
    );
  }
}

class _SongStatistic extends StatelessWidget {
  const _SongStatistic({
    super.key,
    required this.amount,
    required this.title,
  });
  final String amount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          amount,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: kSecondaryColor,
              ),
        ),
        SizedBox(height: 10.h),
        Text(title),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
              ),
            ),
          ),
        ),
        Text(
          'Diana White',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        OutlinedButton(
          onPressed: () {},
          child: const Text(
            'Edit Profile',
            style: TextStyle(color: kAccentColor),
          ),
        )
      ],
    );
  }
}
