import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Профиль',
            style: TextStyle(color: Color.fromRGBO(102, 155, 188, 1), fontSize: 40),
          ),
        ),
        backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      ),
      backgroundColor: const Color.fromRGBO(57, 62, 65, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/default_avatar.png'),
                backgroundColor: Color.fromRGBO(102, 155, 188, 1),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Товмасян Григорий', // Фамилия и имя
                style: TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                '+7 (967) 185-85-44', // Номер телефона
                style: TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'grisatovmasan@gmail.com', // Почта
                style: TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Сюда прикуртить логику для редактирования профиля
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(233, 79, 55, 1),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  "Редактировать профиль",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}