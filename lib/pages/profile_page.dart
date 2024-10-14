import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = 'Товмасян Григорий';
  String _phone = '+7 (967) 185-85-44';
  String _email = 'grisatovmasan@gmail.com';

  final TextEditingController _phoneController = TextEditingController();

  void _showEditProfileDialog() {
    TextEditingController nameController = TextEditingController(text: _name);
    TextEditingController emailController = TextEditingController(text: _email);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(102, 155, 188, 1),
          title: const Text('Редактировать профиль'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Имя',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите имя';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Телефон',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите номер телефона';
                    }
                    if (!RegExp(r'^\+7\d{10}$|^\+7\(\d{3}\)\d{3}-\d{2}-\d{2}$|^8\d{10}$').hasMatch(value)) {
                      return 'Пожалуйста, введите корректный номер';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Пожалуйста, введите корректный email';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Сохранить', style: TextStyle(color: Colors.black)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _name = nameController.text;
                    _phone = _phoneController.text;
                    _email = emailController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _phoneController.text = _phone;
  }

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
            Center(
              child: Text(
                _name, // Фамилия и имя
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                _phone, // Номер телефона
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                _email, // Почта
                style: const TextStyle(color: Color.fromRGBO(246, 247, 235, 1), fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _showEditProfileDialog,
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