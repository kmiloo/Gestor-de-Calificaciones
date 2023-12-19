import 'dart:async';

mixin Validators {
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError("Más de 6 caracteres por favor");
      }
    },
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      // Utiliza una expresión regular para validar el formato del correo electrónico
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError("Correo electrónico no válido");
      }
    },
  );
}
