// add_album_page.dart
import 'package:flutter/material.dart';
import 'package:pks_full/models/album.dart';

class AddAlbumPage extends StatefulWidget {
  const AddAlbumPage({super.key});

  @override
  State<AddAlbumPage> createState() => _AddAlbumPageState();
}

class _AddAlbumPageState extends State<AddAlbumPage> {
  final TextEditingController albumNameController = TextEditingController();
  final TextEditingController albumCoverController = TextEditingController();
  final TextEditingController albumInfoController = TextEditingController();
  final TextEditingController albumPriceController = TextEditingController();
  final TextEditingController albumListenController = TextEditingController();
  final TextEditingController albumTracklistController = TextEditingController();

  void createAlbum() {
    String albumName = albumNameController.text;
    String albumCover = albumCoverController.text;
    String albumInfo = albumInfoController.text;
    double albumPrice = double.tryParse(albumPriceController.text) ?? 0;
    String albumListen = albumListenController.text;
    List<String> albumTracklist = albumTracklistController.text.split('\n');

    if (albumName.isNotEmpty && albumCover.isNotEmpty && albumInfo.isNotEmpty && albumPrice > 0 && albumListen.isNotEmpty) {
      Album album = Album(
        albumName: albumName,
        albumCover: albumCover,
        albumInfo: albumInfo,
        price: albumPrice,
        listen: albumListen,
        tracklist: albumTracklist,
      );
      Navigator.pop(context, album);
    }
  }

  @override
  void dispose() {
    albumNameController.dispose();
    albumCoverController.dispose();
    albumInfoController.dispose();
    albumPriceController.dispose();
    albumListenController.dispose();
    albumTracklistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление альбома", style: TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7), fontSize: 24),),
        backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      ),
      backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: albumNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите название альбома",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Альбом",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: albumCoverController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите ссылку на обложку альбома",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Обложка",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: albumPriceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите стоимость альбома",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Стоимость",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: albumInfoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите информацию об альбоме",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Информация",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 7,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: albumListenController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите ссылку на прослушивание альбома",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Ссылка на прослушивание",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: albumTracklistController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  hintText: "Введите треклист альбома (каждый трек с новой строки)",
                  hintStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 0.7)),
                  labelText: "Треклист",
                  labelStyle: const TextStyle(color: Color.fromRGBO(102, 155, 188, 1)),
                ),
                maxLines: 10,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: createAlbum,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(233, 79, 55, 1),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: const Size(300, 50),
                ),
                child: const Text("Добавить альбом",
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