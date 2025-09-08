import 'package:flutter/material.dart';
import 'userstorage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  String _mensaje = "";

  void _signIn() {
    String usuario = _userController.text.trim();
    String email = _emailController.text.trim();
    String contrasena = _passController.text.trim();
    String confirmarContrasena = _confirmPassController.text.trim();

    if (usuario.isEmpty || email.isEmpty || contrasena.isEmpty || confirmarContrasena.isEmpty) {
      setState(() {
        _mensaje = "❌ Por favor completa todos los campos";
      });
      return;
    }

    if (UserStorage.usuarioExiste(usuario)) {
      setState(() {
        _mensaje = "❌ El nombre de usuario ya existe";
      });
      return;
    }

    if (UserStorage.emailExiste(email)) {
      setState(() {
        _mensaje = "❌ El email ya está registrado";
      });
      return;
    }

    if (contrasena != confirmarContrasena) {
      setState(() {
        _mensaje = "❌ Las contraseñas no coinciden";
      });
      return;
    }

    if (contrasena.length < 4) {
      setState(() {
        _mensaje = "❌ La contraseña debe tener al menos 4 caracteres";
      });
      return;
    }

    if (!email.contains("@")) {
      setState(() {
        _mensaje = "❌ Por favor ingresa un email válido";
      });
      return;
    }

    // Registrar usuario
    UserStorage.agregarUsuario(usuario, email, contrasena);
    
    setState(() {
      _mensaje = "✅ Usuario $usuario registrado exitosamente";
    });

    // Opcional: Volver al login después de 2 segundos
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  void _volverALogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _volverALogin,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/fondo1.jpg",
              fit: BoxFit.cover
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(200),
              child: Container(
                padding: const EdgeInsets.all(205),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 37, 61, 255), Color.fromARGB(255, 189, 16, 78)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "NeuroMotion",
                      style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),

                    TextField(
                      controller: _userController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 58, 243, 33)),
                        hintText: "Nombre de usuario",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 58, 243, 33)),
                        hintText: "Correo electrónico",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      controller: _passController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 58, 243, 33)),
                        hintText: "Contraseña",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      controller: _confirmPassController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline, color: Color.fromARGB(255, 58, 243, 33)),
                        hintText: "Confirmar contraseña",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),

                    const Text(
                      "Registro",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Registrarse",
                        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      _mensaje,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}