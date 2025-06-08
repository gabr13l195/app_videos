import 'package:app_clase/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppVideos());
}

class AppVideos extends StatelessWidget {
  const AppVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Cuerpo());
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Welcome(),
    );
  }
}
