import 'package:app_clase/navigation/drawer.dart';
import 'package:flutter/material.dart';

class Peliculas extends StatelessWidget {
  const Peliculas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Center(child: Text("Peliculas Screen Body")),
          ],
        ),
      ),
      drawer: MiDrawer(),
    );
  }
}