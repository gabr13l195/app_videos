import 'package:app_clase/screens/CatalogoScreen.dart';
import 'package:app_clase/screens/PeliculasScreen.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: [
              Text("Gabriel Videos"),
              Expanded(child: Image.network("https://w7.pngwing.com/pngs/777/419/png-transparent-amazon-com-amazon-video-streaming-media-amazon-prime-television-prime-logo-television-blue-text-thumbnail.png")),
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
