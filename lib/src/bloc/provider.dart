import 'package:flutter/material.dart';
import 'package:gestor_calificaciones/src/bloc/login_bloc.dart';
export 'package:gestor_calificaciones/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  final LoginBloc loginbloc = LoginBloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()?.loginbloc)!;
  }
}
