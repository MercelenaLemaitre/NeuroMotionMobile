🧠 NeuroMotionMobile

## Aplicación móvil Flutter con autenticación completa y almacenamiento local 📱

---

## Descripción
NeuroMotionMobile es una app multiplataforma en Flutter que proporciona gestión robusta de usuarios con persistencia local de datos. ✨

---

## ✨ Características
- 🔐 **Autenticación Completa**
  - Registro e inicio de sesión seguro
  - Validación de credenciales en tiempo real
- 💾 **Almacenamiento Persistente**
  - Datos de usuario guardados localmente
  - Gestión de sesiones offline
- 📱 **Multiplataforma**
  - Compatible con Android/iOS
  - Interfaz responsive y adaptable
- 🏗️ **Arquitectura Modular**
  - Servicios organizados y escalables
  - Código mantenible con patrón limpio

---

## 📂 Estructura del Proyecto
```
neuromotion_mobile/
├── lib/
│   ├── pages/
│   │   ├── sign_in.dart       # 📝 Página de Registro
│   │   ├── login.dart         # 🔑 Página de Inicio de Sesión
│   │   ├── welcome.dart       # 🎉 Página de Bienvenida
│   │   ├── login_screen.dart  # 🖥️ Nueva vista: Log In
│   │   ├── sign_in_screen.dart# ✍️ Nueva vista: Sign In
│   │   └── user_storage.dart  # 💾 Gestión de almacenamiento local
│   ├── screens/               # 🖥️ Nuevas vistas en la carpeta screens
│   │   ├── login_screen.dart
│   │   ├── sign_in_screen.dart
│   │   └── welcome_screen.dart
│   ├── services/
│   │   └── user_storage.dart  # 💾 Servicios de almacenamiento
│   └── main.dart               # 🚀 Entrada principal
└── pubspec.yaml                # 📦 Dependencias
```

---

## 🛠️ Tecnologías
| Tecnologías | Propósito |
|--------------|------------|
| Flutter      | Framework de desarrollo multiplataforma |
| Dart         | Lenguaje de programación |
| SDK móvil    | Android/iOS |

---

## 🚀 Instalación
**Prerrequisitos**  
✅ Flutter SDK + Dart  
✅ Android Studio o VS Code  
✅ Emulador o dispositivo físico

**Configuración rápida**  
```bash
# 1. Clona el repositorio
git clone https://github.com/tu-usuario/neuromotion_mobile.git
cd neuromotion_mobile

# 2. Instala dependencias
flutter pub get

# 3. Verifica la configuración
flutter doctor

# 4. Ejecuta la app
flutter run
```

---

## 🔑 Funcionalidades principales
- Sistema de usuarios:
  - Registro: creación de cuentas nuevas ✍️
  - Login: acceso seguro 🔐
  - Sesiones: persistencia automática 💤
- Gestión de datos local:
  - almacenamiento offline 💾
  - CRUD completo de usuario 📝
  - encriptación para almacenamiento seguro 🔒
- Interfaz de usuario responsive, intuitiva y consistente 🎨

---

## 🤝 Desarrollo y Workflow
- Control de versiones: Git / GitHub
- Colaboración mediante Pull Requests
- Semantic Versioning para versiones estables

---

## 🐞 Troubleshooting
- Dependencias:  
  ```bash
  flutter clean && flutter pub get
  ```
- Problemas de compilación:  
  ```bash
  flutter clean && flutter build apk
  ```
- Dispositivos conectados:  
  ```bash
  flutter devices
  ```

---

## 📚 Recursos
- [Flutter Docs](https://flutter.dev/docs)
- [Dart Guide](https://dart.dev/guides)
- [Mobile Development](https://flutter.dev/docs/development/ui/layout)
- [Contribuir](#)

---

## 📝 Notas adicionales
Se añadieron 3 nuevas vistas en la carpeta `lib/screens`:

- **Log In Screen** (`login_screen.dart`)  
- **Sign In Screen** (`sign_in_screen.dart`)  
- **Welcome Screen** (`welcome_screen.dart`)  

Estas vistas complementan las páginas existentes, proporcionando una experiencia más completa y modular.

---
