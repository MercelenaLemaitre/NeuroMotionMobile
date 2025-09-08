import 'package:flutter/material.dart';
import 'signinpage.dart';
import 'welcome.dart';
import 'userstorage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String _mensaje = "";

  void _login() {
    String usuario = _userController.text.trim();
    String contrasena = _passController.text.trim();

    if (usuario.isEmpty || contrasena.isEmpty) {
      setState(() {
        _mensaje = "❌ Por favor completa todos los campos";
      });
      return;
    }

    // Verificar login (usuario o email)
    bool loginExitoso = UserStorage.verificarLogin(usuario, contrasena);

    if (loginExitoso) {
      String? nombreUsuario = UserStorage.obtenerNombreUsuario(usuario);

      // Navegar a la página de bienvenida
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(usuario: nombreUsuario ?? usuario)
        ),
      );
    } else {
      setState(() {
        _mensaje = "❌ Usuario/Email o contraseña incorrectos";
      });
    }
  }

  void _navegarARegistro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.all(40),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 37, 61, 255), Color.fromARGB(255, 189, 16, 78)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
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
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _userController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 58, 243, 33)),
                        hintText: "Usuario o Email",
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
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Ingresar",
                        style: TextStyle(fontSize: 18, color: Colors.black),
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
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: _navegarARegistro,
                      child: const Text(
                        "¿No tienes cuenta? Regístrate aquí",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
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
