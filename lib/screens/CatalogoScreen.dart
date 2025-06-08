import 'package:app_clase/navigation/drawer.dart';
import 'package:flutter/material.dart';
import 'package:app_clase/widgets/horizontal_scroll_list.dart';

class Catalogo extends StatelessWidget {
  const Catalogo({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de ejemplo de películas
    final List<Map<String, dynamic>> peliculas = [
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'title': 'Película 1',
      },
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'title': 'Película 2',
      },
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'title': 'Película 3',
      },
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'title': 'Película 4',
      },
    ];

    // Lista de ejemplo de series
    final List<Map<String, dynamic>> series = [
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'title': 'Serie 1',
      },
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'title': 'Serie 2',
      },
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'title': 'Serie 3',
      },
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'title': 'Serie 4',
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      //Hay que centrar el appBar
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Catalogo",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Peliculas y Series",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
            Center(
              child: Text(
                "Aquí encontrarás las mejores películas y series",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "¡Explora nuestro catálogo!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Películas Populares",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  HorizontalScrollList(
                    items: peliculas,
                    type: 'movie',
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Series Populares",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  HorizontalScrollList(
                    items: series,
                    type: 'series',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MiDrawer(),
    );
  }
}

//Se crear un widget para el catalgo con un scroll horizontal donde se pasen las imagenes de las peliculas y se redireccionaán hacia la reproduccion
//de la pelicula


