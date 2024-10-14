import 'package:flutter/material.dart';
import 'package:pks_full/models/album.dart';

class CartPage extends StatefulWidget {
  final List<Album> cartEntries;
  final Function(int) removeFromCart;
  final Function(int, int) updateQuantity;

  const CartPage({
    super.key,
    required this.cartEntries,
    required this.removeFromCart,
    required this.updateQuantity,
  });

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(102, 155, 188, 1),
          title: const Text('Подтверждение удаления'),
          content: const Text('Вы уверены, что хотите удалить этот товар из корзины?'),
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
                widget.removeFromCart(index);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.cartEntries[index].albumName} удален из корзины'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Корзина',
            style: TextStyle(color: Color.fromRGBO(102, 155, 188, 1), fontSize: 40),
          ),
        ),
        backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      ),
      backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      body: widget.cartEntries.isEmpty
          ? const Center(
        child: Text(
          "Корзина пуста",
          style: TextStyle(color: Color.fromRGBO(102, 155, 188, 1), fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: widget.cartEntries.length,
        itemBuilder: (context, index) {
          final album = widget.cartEntries[index];
          return Dismissible(
            key: Key(album.albumName),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                _showDeleteConfirmationDialog(context, index);
                return false; // Prevent automatic dismissal
              }
              return null;
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: Image.asset(
                album.albumCover,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                album.albumName,
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
              ),
              subtitle: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    color: const Color.fromRGBO(102, 155, 188, 1),
                    onPressed: () {
                      if (album.quantity > 1) {
                        widget.updateQuantity(index, album.quantity - 1);
                      } else {
                        _showDeleteConfirmationDialog(context, index);
                      }
                    },
                  ),
                  Text(
                    '${album.quantity}',
                    style: const TextStyle(
                      color: Color.fromRGBO(102, 155, 188, 1),
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: const Color.fromRGBO(102, 155, 188, 1),
                    onPressed: () {
                      widget.updateQuantity(index, album.quantity + 1);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}