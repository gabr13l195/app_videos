import 'package:app_clase/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://uornzdiywlwewdutxywr.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVvcm56ZGl5d2x3ZXdkdXR4eXdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAwMTc3MzUsImV4cCI6MjA2NTU5MzczNX0.-fwCV_KCyWEhgdzAIj6XzvliimvNxDPkzHnY7Qh2LQA',
  );

  runApp(const AppVideos());
}

// Get a reference to your Supabase client
final supabase = Supabase.instance.client;

class AppVideos extends StatelessWidget {
  const AppVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Cuerpo(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
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
