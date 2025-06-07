import 'package:app_clase/screens/CatalogoScreen.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: FilledButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Catalogo()),
        ),
        child: Text("Catalogo Screen"),
      ),
    );
  }
}
