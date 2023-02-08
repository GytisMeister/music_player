import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/models/song_model.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../components/components.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Get.arguments ?? Song.songs[0];

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[1].url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[2].url}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
          elevation: 0,
          backgroundColor: kScaffold,
          title: Text(
            'Chill Collection',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.grid_view_rounded),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  song.coverUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              song.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            Text(
              song.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: kSecondaryColor),
            ),
            _MusicPlayer(
              song: song,
              seekBarDataStream: _seekBarDataStream,
              audioPlayer: audioPlayer,
            ),
            const Spacer(),
            Column(
              children: [
                const Text(
                  'LYRICS',
                  style: TextStyle(color: kSecondaryColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: kSecondaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream;

  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<SeekBarData>(
          stream: _seekBarDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            return SeekBar(
              postion: positionData?.position ?? Duration.zero,
              duration: positionData?.duration ?? Duration.zero,
              onChanged: audioPlayer.seek,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Next:'),
              SizedBox(width: 5.w),
              Text(
                'Password Infinity(Password Infinity)',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: kAccentColor),
              )
            ],
          ),
        ),
        PlayerButtons(audioPlayer: audioPlayer)
      ],
    );
  }
}
