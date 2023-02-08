class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: 'Easy Lifestyle',
      description: 'Easy Lifestyle',
      url: 'assets/songs/easy_lifestyle.mp3',
      coverUrl: 'assets/covers/cover_4.jpg',
    ),
    Song(
      title: 'LoFi Study',
      description: 'LoFi Study',
      url: 'assets/songs/lofi_study.mp3',
      coverUrl: 'assets/covers/cover_2.jpg',
    ),
    Song(
      title: 'Password Infinity',
      description: 'Password Infinity',
      url: 'assets/songs/password_infinity.mp3',
      coverUrl: 'assets/covers/cover_3.jpg',
    ),
    Song(
      title: 'Weeknds',
      description: 'Weeknds',
      url: 'assets/songs/weeknds.mp3',
      coverUrl: 'assets/covers/cover_1.jpg',
    ),
  ];
}
