import 'package:flutter/material.dart';
import 'package:gestor_calificaciones/src/bloc/provider.dart';
import 'package:gestor_calificaciones/src/pages/login.dart';
import 'package:gestor_calificaciones/src/preferencias_usuario/preferencias_usuarios.dart';


class MyApp extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return Provider(
      child:
      MaterialApp(
        home: Center(
          child: Login(),
        )
      )
    );
  
  }
}