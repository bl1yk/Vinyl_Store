class Album {
  final String albumName;
  final String albumArtist;
  final String albumCover;
  final double price;
  final String albumInfo;
  final List<String> trackList;
  final String listen;
  bool isFavorite;
  int quantity;

  Album({
    required this.albumName,
    required this.albumArtist,
    required this.albumCover,
    required this.price,
    required this.albumInfo,
    required this.trackList,
    required this.listen,
    this.isFavorite = false,
    this.quantity = 0,
  });
}