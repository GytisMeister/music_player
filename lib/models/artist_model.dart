class Artist {
  final String name;
  final String url;

  Artist({
    required this.name,
    required this.url,
  });

  static List<Artist> artists = [
    Artist(
      name: 'Calvin Harris',
      url: 'assets/artists/calvin_harris.jpg',
    ),
    Artist(
      name: 'Katy Perry',
      url: 'assets/artists/katy_perry.jpg',
    ),
    Artist(
      name: 'Ava Max',
      url: 'assets/artists/ava_max.jpg',
    ),
    Artist(
      name: 'Blake Shelton',
      url: 'assets/artists/blake_shelton.jpg',
    ),
    Artist(
      name: 'Nic D',
      url: 'assets/artists/nic_d.jpg',
    ),
    Artist(
      name: 'Connor Price',
      url: 'assets/artists/connor_price.jpg',
    ),
    Artist(
      name: 'T-Pain',
      url: 'assets/artists/t_pain.jpg',
    ),
  ];
}
