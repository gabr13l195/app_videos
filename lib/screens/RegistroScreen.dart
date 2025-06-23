import 'package:app_clase/screens/WelcomeScreen.dart';
import 'package:app_clase/supabase_client.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _nombresController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _edadController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  File? _imagenSeleccionada;

  Future<void> _seleccionarImagen() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Seleccionar imagen',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Navigator.pop(context);
                        await _abrirGaleria();
                      },
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Galería'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 136, 29),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Navigator.pop(context);
                        await _abrirCamara();
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Cámara'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 136, 29),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _abrirGaleria() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );
    
    if (imagen != null) {
      setState(() {
        _imagenSeleccionada = File(imagen.path);
      });
    }
  }

  Future<void> _abrirCamara() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );
    
    if (imagen != null) {
      setState(() {
        _imagenSeleccionada = File(imagen.path);
      });
    }
  }

  Future<void> _signUp() async {
    if (_nombresController.text.isEmpty || 
        _apellidosController.text.isEmpty || 
        _edadController.text.isEmpty ||
        _emailController.text.isEmpty || 
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor completa todos los campos')),
      );
      return;
    }

    // Validar que la edad sea un número válido
    final edad = int.tryParse(_edadController.text);
    if (edad == null || edad <= 0 || edad > 120) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa una edad válida')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        data: {
          'nombres': _nombresController.text.trim(),
          'apellidos': _apellidosController.text.trim(),
          'edad': edad,
        },
      );

      if (res.user != null) {
        // Si hay imagen seleccionada, subirla al storage
        if (_imagenSeleccionada != null) {
          try {
            final String fileName = '${res.user!.id}_profile.jpg';
            await supabase.storage
                .from('profile-images')
                .upload(fileName, _imagenSeleccionada!);
            
            // Actualizar el perfil del usuario con la URL de la imagen
            await supabase.auth.updateUser(
              UserAttributes(
                data: {
                  'profile_image_url': fileName,
                },
              ),
            );
          } catch (e) {
            print('Error al subir imagen: $e');
            // Continuar con el registro aunque falle la subida de imagen
          }
        }

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro exitoso! Por favor verifica tu email.')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Welcome()),
        );
      }
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error inesperado')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nombresController.dispose();
    _apellidosController.dispose();
    _edadController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      appBar: AppBar(
        title: const Text("Registro"),
        backgroundColor: const Color.fromARGB(255, 193, 238, 191),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ingresar tus datos para registrarte: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RobotoMono',
                ),
              ),
              const SizedBox(height: 20),
              
              // Sección de imagen de perfil
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _imagenSeleccionada != null 
                          ? FileImage(_imagenSeleccionada!) 
                          : null,
                      child: _imagenSeleccionada == null
                          ? const Icon(Icons.person, size: 50, color: Colors.grey)
                          : null,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _seleccionarImagen,
                      icon: const Icon(Icons.add_a_photo),
                      label: const Text('Seleccionar Foto'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 136, 29),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Campo Nombres
              TextField(
                controller: _nombresController,
                decoration: const InputDecoration(
                  labelText: "Nombres",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                textCapitalization: TextCapitalization.words,
                autocorrect: false,
              ),
              
              const SizedBox(height: 16),
              
              // Campo Apellidos
              TextField(
                controller: _apellidosController,
                decoration: const InputDecoration(
                  labelText: "Apellidos",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                textCapitalization: TextCapitalization.words,
                autocorrect: false,
              ),
              
              const SizedBox(height: 16),
              
              // Campo Edad
              TextField(
                controller: _edadController,
                decoration: const InputDecoration(
                  labelText: "Edad",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.cake),
                ),
                keyboardType: TextInputType.number,
                autocorrect: false,
              ),
              
              const SizedBox(height: 16),
              
              // Campo Email
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Ingresa tu correo electrónico",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
              ),
              
              const SizedBox(height: 16),
              
              // Campo Contraseña
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Ingresa tu contraseña",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                autocorrect: false,
              ),
              
              const SizedBox(height: 24),
              
              Center(
                child: FilledButton.icon(
                  onPressed: _isLoading ? null : _signUp,
                  label: Text(
                    _isLoading ? "Registrando..." : "Registrarse",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  icon: const Icon(Icons.add_home_sharp),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 3, 136, 29),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}