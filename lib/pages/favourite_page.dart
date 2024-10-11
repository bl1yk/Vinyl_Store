import 'package:flutter/material.dart';
import 'package:pks_full/models/album.dart';
import 'package:pks_full/pages/item_page.dart';

class FavouritePage extends StatefulWidget {
  final List<Album> favoriteEntries;
  final Function(int) removeFromFavorites;
  final Function(int) toggleFavorite;
  final Function(int) removeAlbum;
  final Function(int) addToCart;

  const FavouritePage({
    super.key,
    required this.favoriteEntries,
    required this.removeFromFavorites,
    required this.toggleFavorite,
    required this.removeAlbum,
    required this.addToCart,
  });

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Избранное',
            style: TextStyle(color: Color.fromRGBO(102, 155, 188, 1), fontSize: 40),
          ),
        ),
        backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      ),
      backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      body: widget.favoriteEntries.isEmpty
          ? const Center(
        child: Text(
          "Нет избранных альбомов",
          style: TextStyle(color: Color.fromRGBO(102, 155, 188, 1), fontSize: 18),
        ),
      )
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
        ),
        itemCount: widget.favoriteEntries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemPage(
                    album: widget.favoriteEntries[index],
                    index: index,
                    toggleFavorite: widget.toggleFavorite,
                    removeAlbum: widget.removeAlbum,
                    addToCart: widget.addToCart,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color.fromRGBO(233, 79, 55, 1),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.favoriteEntries[index].albumName,
                          style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Image.asset(
                      widget.favoriteEntries[index].albumCover,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      color: const Color.fromRGBO(102, 155, 188, 1),
                      onPressed: () {
                        widget.removeFromFavorites(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}