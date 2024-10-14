import 'package:flutter/material.dart';
import 'package:pks_full/models/album.dart';
import 'package:pks_full/pages/item_page.dart';

class StoreItem extends StatelessWidget {
  final Album album;
  final int index;
  final Function(int) toggleFavorite;
  final Function(int) removeAlbum;
  final Function(int) addToCart;

  const StoreItem({
    super.key,
    required this.album,
    required this.index,
    required this.toggleFavorite,
    required this.removeAlbum,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(
              album: album,
              index: index,
              toggleFavorite: toggleFavorite,
              removeAlbum: removeAlbum,
              addToCart: addToCart,
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
                    album.albumName,
                    style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Image.asset(
                album.albumCover,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              IconButton(
                icon: Icon(
                  album.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: const Color.fromRGBO(102, 155, 188, 1),
                ),
                onPressed: () {
                  toggleFavorite(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}