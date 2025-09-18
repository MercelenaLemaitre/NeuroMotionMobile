// Clase para manejar los usuarios registrados
class UserStorage {
  static final List<Map<String, String>> _usuarios = [
    {"usuario": "paula", "email": "paula@example.com", "password": "1234"}
  ];

  // Agregar nuevo usuario
  static void agregarUsuario(String usuario, String email, String password) {
    _usuarios.add({
      "usuario": usuario,
      "email": email, 
      "password": password
    });
  }

  // Verificar si el usuario existe
  static bool usuarioExiste(String usuario) {
    return _usuarios.any((user) => user["usuario"] == usuario);
  }

  // Verificar si el email existe
  static bool emailExiste(String email) {
    return _usuarios.any((user) => user["email"] == email);
  }

  // Verificar login (usuario o email)
  static bool verificarLogin(String login, String password) {
    return _usuarios.any((user) =>
      (user["usuario"] == login || user["email"] == login) &&
       user["password"] == password
    );
  }

  // Obtener nombre de usuario por usuario o email
  static String? obtenerNombreUsuario(String login) {
    final user = _usuarios.firstWhere(
      (user) => user["usuario"] == login || user["email"] == login,
      orElse: () => {}
    );
    return user["usuario"];
  }
}
