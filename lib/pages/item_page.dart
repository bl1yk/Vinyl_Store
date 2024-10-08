import 'package:flutter/material.dart';
import 'package:pks_full/models/album.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemPage extends StatefulWidget {
  final Album album;
  final int index;
  final Function(int) toggleFavorite;
  final Function(int) addToCart;
  final Function(int) removeAlbum;

  const ItemPage({
    super.key,
    required this.album,
    required this.index,
    required this.toggleFavorite,
    required this.addToCart,
    required this.removeAlbum,
  });

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.album.isFavorite;
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(102, 155, 188, 1),
          title: const Text('Подтверждение удаления'),
          content: const Text('Вы уверены, что хотите удалить этот альбом?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Удалить', style: TextStyle(color: Colors.black)),
              onPressed: () {
                widget.removeAlbum(widget.index);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.toggleFavorite(widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.album.albumName),
        titleTextStyle: const TextStyle(
          color: Color.fromRGBO(102, 155, 188, 1),
          fontSize: 28,
        ),
        backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: const Color.fromRGBO(233, 79, 55, 1),
            ),
            onPressed: _toggleFavorite,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: const Color.fromRGBO(233, 79, 55, 1),
            onPressed: () {
              widget.addToCart(widget.index);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Альбом добавлен в корзину'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                widget.album.albumCover,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                widget.album.albumName,
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                '${widget.album.price}₽',
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 20),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                    style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 16),
                    children: [
                      const TextSpan(
                        text: '     ',
                      ),
                      TextSpan(
                        text: widget.album.albumInfo,
                      )
                    ]
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Треклист:',
                style: TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
              ),
              const SizedBox(height: 8),
              ...widget.album.trackList.map((track) => Text(
                track,
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 16),
              )),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _launchURL(widget.album.listen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(233, 79, 55, 1),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: const Size(300, 50),
                ),
                child: const Text("Слушать",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _showDeleteConfirmationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(233, 79, 55, 1),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: const Size(300, 50),
                ),
                child: const Text("Удалить товар",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}