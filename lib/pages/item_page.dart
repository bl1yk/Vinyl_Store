// item_page.dart
import 'package:flutter/material.dart';
import 'package:pks_full/models/album.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemPage extends StatelessWidget {
  final Album album;

  const ItemPage({super.key, required this.album});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.albumName),
        backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      ),
      backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                album.albumCover,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                album.albumName,
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                '${album.price}₽',
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 20),
              ),
              const SizedBox(height: 16),
              Text(
                album.albumInfo,
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Треклист:',
                style: TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
              ),
              const SizedBox(height: 8),
              ...album.tracklist.map((track) => Text(
                track,
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 16),
              )),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _launchURL(album.listen),
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
            ],
          ),
        ),
      ),
    );
  }
}