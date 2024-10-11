import 'package:flutter/material.dart';
import 'package:pks_full/models/album.dart';
import 'package:pks_full/pages/home_page.dart';
import 'package:pks_full/pages/favourite_page.dart';
import 'package:pks_full/pages/profile_page.dart';
import 'package:pks_full/pages/cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinyl Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Album> favoriteEntries = [];
  List<Album> cartEntries = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void removeFromFavorites(int index) {
    setState(() {
      favoriteEntries.removeAt(index);
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      Album album = entries[index];
      album.isFavorite = !album.isFavorite;
      if (favoriteEntries.contains(album)) {
        favoriteEntries.remove(album);
      } else {
        favoriteEntries.add(album);
      }
    });
  }

  void removeAlbum(int index) {
    setState(() {
      entries.removeAt(index);
    });
  }

  void addToCart(int index) {
    setState(() {
      Album album = entries[index];
      if (cartEntries.contains(album)) {
        album.quantity++;
      } else {
        album.quantity = 1;
        cartEntries.add(album);
      }
    });
  }

  void removeFromCart(int index) {
    setState(() {
      cartEntries.removeAt(index);
    });
  }

  void updateQuantity(int index, int quantity) {
    setState(() {
      cartEntries[index].quantity = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      HomePage(
        removeAlbum: removeAlbum,
        toggleFavorite: toggleFavorite,
        addToCart: addToCart,
      ),
      FavouritePage(
        favoriteEntries: favoriteEntries,
        removeFromFavorites: removeFromFavorites,
        toggleFavorite: toggleFavorite,
        removeAlbum: removeAlbum,
        addToCart: addToCart,
      ),
      CartPage(
        cartEntries: cartEntries,
        removeFromCart: removeFromCart,
        updateQuantity: updateQuantity,
      ),
      ProfilePage(),
    ];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color.fromRGBO(102, 155, 188, 1),
            unselectedItemColor: Colors.grey,
            backgroundColor: Color.fromRGBO(57, 62, 65, 1),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Профиль',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}