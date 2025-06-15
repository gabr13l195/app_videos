import 'package:app_clase/navigation/drawer.dart';
import 'package:app_clase/screens/WelcomeScreen.dart';
import 'package:app_clase/supabase_client.dart';
import 'package:flutter/material.dart';
import 'package:app_clase/widgets/horizontal_scroll_list.dart';
import 'package:app_clase/widgets/back_floating_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Catalogo extends StatefulWidget {
  const Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final session = supabase.auth.currentSession;
    if (session == null) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    }
  }

  Future<void> _signOut() async {
    try {
      await supabase.auth.signOut();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al cerrar sesión')),
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir el enlace')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Lista de películas con sus URLs de imagen y enlaces
    final List<Map<String, dynamic>> peliculas = [
      {
        'imageUrl': 'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
        'title': 'Oppenheimer',
        'redirectUrl': 'https://www.youtube.com/watch?v=uYPbbksJxIg',
      },
      {
        'imageUrl': 'https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg',
        'title': 'Dune',
        'redirectUrl': 'https://www.youtube.com/watch?v=pBk4NYhWNMM',
      },
      {
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqWxEUUYk_r3N4kbQXzFCi_EUR3Ge4WcSuMA&s',
        'title': 'Guardianes de la Galaxia Vol. 3',
        'redirectUrl': 'https://www.youtube.com/watch?v=u3V5KDHRQvk',
      },
      {
        'imageUrl': 'https://m.media-amazon.com/images/M/MV5BYzEwZjczOTktYzU1OS00YjJlLTgyY2UtNWEzODBlN2RjZDEwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
        'title': 'Fast X',
        'redirectUrl': 'https://www.youtube.com/watch?v=32RAq6JzY-w',
      },
    ];

    // Lista de series con sus URLs de imagen y enlaces
    final List<Map<String, dynamic>> series = [
      {
        'imageUrl': 'https://pics.filmaffinity.com/The_Last_of_Us_T1_Serie_de_TV-722385305-large.jpg',
        'title': 'The Last of Us',
        'redirectUrl': 'https://www.youtube.com/watch?v=uLtkt8BonwM',
      },
      {
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwPKlpSF1q_Gw4Txv9sjUoJFAYRsNgMqZGdw&s',
        'title': 'Stranger Things',
        'redirectUrl': 'https://www.youtube.com/watch?v=b9EkMc79ZSU',
      },
      {
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnYvzvNtf1Dykb4GVnAVgE1pDeYz0FaBxrXg&s',
        'title': 'The Mandalorian',
        'redirectUrl': 'https://www.youtube.com/watch?v=aOC8E8z_ifw',
      },
      {
        'imageUrl': 'https://m.media-amazon.com/images/M/MV5BMzU5ZGYzNmQtMTdhYy00OGRiLTg0NmQtYjVjNzliZTg1ZGE4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
        'title': 'Breaking Bad',
        'redirectUrl': 'https://www.youtube.com/watch?v=HhesaQXLuRY',
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Catalogo",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 193, 238, 191),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Peliculas y Series",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "Aquí encontrarás las mejores películas y series",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "¡Explora nuestro catálogo!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Películas Populares",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      HorizontalScrollList(
                        items: peliculas,
                        type: 'movie',
                        onItemTap: (item) => _launchUrl(item['redirectUrl']),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Series Populares",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      HorizontalScrollList(
                        items: series,
                        type: 'series',
                        onItemTap: (item) => _launchUrl(item['redirectUrl']),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BackFloatingButton(
            backgroundColor: Colors.white.withOpacity(0.8),
            iconColor: Colors.black,
          ),
        ],
      ),
      drawer: MiDrawer(),
    );
  }
}

//Se crear un widget para el catalgo con un scroll horizontal donde se pasen las imagenes de las peliculas y se redireccionaán hacia la reproduccion
//de la pelicula


