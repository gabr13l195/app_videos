import 'package:app_clase/screens/LoginScreen.dart';
import 'package:app_clase/screens/RegistroScreen.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Bienvenido",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Si quieres disfrutar de muchas peliculas y series, por favor inicia sesión o regístrate.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            btnLogin(context),
            SizedBox(height: 10),
            btnRegistro(context),
          ],
        ),
      ),
    );
  }
}

Widget btnLogin(context) {
  return (FilledButton.icon(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    ),
    label: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'RobotoMono'),),
    icon: Icon(Icons.login_rounded),
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 3, 136, 29)),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),

    ),
  ));
}

Widget btnRegistro(context) {
  return (ElevatedButton.icon(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Registro()),
    ),
    label: Text("Registro", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'RobotoMono'),),
    icon: Icon(Icons.app_registration),
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 3, 98, 101)),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ));
}
