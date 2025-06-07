import 'package:app_clase/screens/LoginScreen.dart';
import 'package:app_clase/screens/RegistroScreen.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Welcome Screen"),),
      body: Center(
        child: Column(
          children: [
            Text("Welcome"),
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              ),
              child: Text("Login"),
            ),
            btnRegistro(context),
          ],
        ),
      ),
    );
  }
}

Widget btnRegistro(context) {
  return (ElevatedButton.icon(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Registro()),
    ),
    label: Text("Registro"),
    icon: Icon(Icons.account_circle_outlined),
  ));
}
