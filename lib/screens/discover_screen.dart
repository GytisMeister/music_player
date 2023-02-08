import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/components.dart';
import '../constants.dart';
import '../models/models.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ForYou> forYou = ForYou.forYou;
    List<Song> song = Song.songs;
    List<Advertisment> advertisment = Advertisment.advertisments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kScaffold,
        automaticallyImplyLeading: false,
        title: Text(
          'Discover',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SearchTextField(),
            _PerfectForYou(
              forYou: forYou,
              advertisment: advertisment,
            ),
            _TopHits(songs: song),
          ],
        ),
      ),
    );
  }
}

class _TopHits extends StatelessWidget {
  const _TopHits({
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
            child: SectionHeader(title: 'April Popular Hits'),
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

class _PerfectForYou extends StatelessWidget {
  const _PerfectForYou({
    required this.forYou,
    required this.advertisment,
  });

  final List<ForYou> forYou;
  final List<Advertisment> advertisment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Perfect For You',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.sp),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ForYou.forYou.length,
              itemBuilder: (context, index) {
                return ForYouCard(
                  forYou: forYou[index],
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.19,
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: Advertisment.advertisments.length,
              itemBuilder: (context, index) {
                return PlaylistAdvertismentCard(
                  advertisment: advertisment[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D0D0D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: kSecondaryColor,
            ),
            border: InputBorder.none,
            hintText: 'Search..',
          ),
        ),
      ),
    );
  }
}
