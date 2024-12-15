import 'package:flutter/material.dart';
import './food/menu_food.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pertemuan Ketiga",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";
  bool isClicked = false;
  bool _passwordVisible = false;

  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodMenuPage(username: _username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Halaman Login"),
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          _username = value;
        },
        decoration: InputDecoration(
          hintText: 'Masukkan Username',
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 2, color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        obscureText: !_passwordVisible,
        onChanged: (value) {
          _password = value;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          hintText: 'Masukkan Password',
          hintStyle: TextStyle(color: Colors.black26),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 2, color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(isClicked ? Colors.green : Colors.red),
        ),
        onPressed: () {
          if (_username == "123" && _password == "123") {
            _navigateToHome();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Berhasil'),
              ),
            );
            setState(() {
              isClicked = !isClicked;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Gagal'),
              ),
            );
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
