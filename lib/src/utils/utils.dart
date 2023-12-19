import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String mensaje){

  showDialog(
    context: context,
    builder: ( context ){
      return AlertDialog(
        title: const Text('Informacion incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    }
  );
}