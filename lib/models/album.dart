// album.dart
class Album {
  final String albumName;
  final String albumCover;
  final String albumInfo;
  final double price;
  final String listen;
  final List<String> tracklist;

  Album({
    required this.albumName,
    required this.albumCover,
    required this.albumInfo,
    required this.price,
    required this.listen,
    required this.tracklist,
  });
}