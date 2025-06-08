import 'package:app_clase/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      appBar: AppBar(
        title: Text("Registro"),
        backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ingresar tus datos para registrarte: ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'RobotoMono',
            ),
          ),
          llenarCamposRegistro(),
          btnRegistro(context),
        ],
      ),
    );
  }
}

Widget llenarCamposRegistro() {
  return Column(
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Ingresa tu usuario",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Ingresa tu contraseña",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Ingresa tu correo electrónico",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Ingresa tu fecha de nacimiento",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget btnRegistro(context) {
  return Center(
    //Debo aumentar el tamaño del boton
    child: (FilledButton.icon(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      ),
      label: Text(
        "Registrase",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'RobotoMono',
        ),
      ),
      icon: Icon(Icons.add_home_sharp),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 3, 136, 29),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    )),
  );
}
