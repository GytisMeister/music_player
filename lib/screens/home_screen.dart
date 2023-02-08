import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/screens/profle_screen.dart';

import '../components/components.dart';

import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Artist> artists = Artist.artists;
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlists;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kScaffold,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Good Morning',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Get.to(const ProfileScreen());
              },
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _FollowedArtists(artists: artists),
            _RecentlyPlayed(songs: songs),
            _Playlist(playlists: playlists)
          ],
        ),
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

class _RecentlyPlayed extends StatelessWidget {
  const _RecentlyPlayed({
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 30, left: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0, bottom: 20),
            child: SectionHeader(title: 'Recently Played'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SongCard(
                    song: songs[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FollowedArtists extends StatelessWidget {
  const _FollowedArtists({
    required this.artists,
  });

  final List<Artist> artists;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Followed Artists',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(height: 20.sp),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artists.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ArtistAvatar(artists: artists[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
