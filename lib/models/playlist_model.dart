import 'models.dart';

class Playlist {
  final String title;
  final String creator;
  final String coverUrl;
  final int numberSongs;
  final bool isDownLoaded;
  final List<Song> songs;

  Playlist({
    required this.title,
    required this.creator,
    required this.coverUrl,
    required this.numberSongs,
    required this.isDownLoaded,
    required this.songs,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Good Morning',
      creator: 'Unwrap',
      coverUrl: 'assets/covers/cover_3.jpg',
      numberSongs: Song.songs.length,
      isDownLoaded: false,
      songs: Song.songs,
    ),
    Playlist(
      title: 'Another Day',
      creator: 'Wrapper',
      coverUrl: 'assets/covers/cover_4.jpg',
      numberSongs: Song.songs.length,
      isDownLoaded: true,
      songs: Song.songs,
    ),
    Playlist(
      title: 'Workout',
      creator: 'Workout Music',
      coverUrl: 'assets/covers/cover_1.jpg',
      numberSongs: Song.songs.length,
      isDownLoaded: false,
      songs: Song.songs,
    ),
  ];
}
