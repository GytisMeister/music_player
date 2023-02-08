class ForYou {
  final String title;
  final String url;

  ForYou({
    required this.title,
    required this.url,
  });

  static List<ForYou> forYou = [
    ForYou(
      title: 'Classics Vibes',
      url: 'assets/covers/Classics_cover.jpg',
    ),
    ForYou(
      title: 'Dance Party',
      url: 'assets/covers/Dance_Party_cover.jpg',
    ),
    ForYou(
      title: 'Office Hits',
      url: 'assets/covers/Focused_cover.jpg',
    ),
    ForYou(
      title: 'Good Vibes',
      url: 'assets/covers/Good_Vibes_cover.jpg',
    ),
  ];
}
