import 'package:app_clase/screens/CatalogoScreen.dart';
import 'package:app_clase/screens/PeliculasScreen.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: [
              Text("Gabriel Videos"),
              // Expanded(child: Image.network("")),
            ],
          )),
          ListTile(
            title: Text("Peliculas"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Peliculas()),
            ),
          ),
          ListTile(
            title: Text("Catalogo"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Catalogo()),
            ),
          ),
        ],
      ),
    );
  }
}
