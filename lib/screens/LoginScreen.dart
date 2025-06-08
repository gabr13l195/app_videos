import 'package:app_clase/screens/CatalogoScreen.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              fontFamily: 'RobotoMono',
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      ),
      backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      //Necesito que esto este centrado tanto horizontal como verticalmente
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ingresa con tus credenciales: ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: 'RobotoMono',
            ),
          ),
          SizedBox(height: 20),
          llenarCamposLogin(),
          SizedBox(height: 20), // Adds some spacing between the widgets
          btnLoginCatalogo(context),
        ],
      ),
    );
  }
}

Widget llenarCamposLogin() {
  return Column(
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Usuario",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 5 ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget btnLoginCatalogo(context) {
  return Center(
    child: (FilledButton.icon(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Catalogo()),
      ),
      label: Text("Iingresar al catálogo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'RobotoMono'),),
      icon: Icon(Icons.video_library),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 3, 136, 29),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    )),
  );
}
