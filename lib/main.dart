import 'package:flutter/material.dart';
import 'package:gestor_calificaciones/src/app.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:gestor_calificaciones/src/preferencias_usuario/preferencias_usuarios.dart';
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
  
}