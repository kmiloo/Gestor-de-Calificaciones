import 'package:flutter/material.dart';
import 'package:gestor_calificaciones/src/bloc/provider.dart';
import 'package:gestor_calificaciones/src/pages/principal.dart';
import 'package:gestor_calificaciones/src/pages/register.dart';
import 'package:gestor_calificaciones/src/providers/usuario_provider.dart';
import 'package:gestor_calificaciones/src/utils/utils.dart';



class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuarioProvide = new UsuarioProvider();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _Loginn(context)
      )
    );
  }

  //la pagina
  Widget _Loginn(BuildContext context){

    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(height: 30.0),

          //imagen logo
          Image.asset(
            "assets/logo_transparent.png",
            height: 250,
          ),

          //texto de inicio de sesion
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                  begin: Alignment.topCenter, // Comienza desde la parte superior
                  end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: const Text(
              "Inicia Sesion",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          
          //inputs con sus textos
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
              
              child: Column(
                children: [

                  _correo(bloc),
                  
                  _contrasena(bloc),

                  _CrearCuenta(context),

                  const SizedBox(height: 16.0),

                  _BotonIniciar(bloc),

                  const SizedBox(height: 20.0),

                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                        begin: Alignment.topCenter, // Comienza desde la parte superior
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },

                  ),

                  
                ],
            )
          ),
        ],
      )
    );
  }

  //input de correo
  Widget _correo(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          children: [
            //correo texto
            Row(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                      begin: Alignment.topCenter, // Comienza desde la parte superior
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "Correo",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            //input correo
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                  begin: Alignment.topCenter, // Comienza desde la parte superior
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              child: TextField(
                keyboardType: TextInputType.emailAddress,
              
                decoration: InputDecoration(
                  //hintText: 'ejemplo@correo.com',
                  filled: true,
                  fillColor: Colors.transparent,

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),



                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),

                  //counterText: snapshot.data,
                  errorText:  snapshot.error != null ? snapshot.error.toString() : null,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  errorStyle: TextStyle(
                    color: Colors.white,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),


                 

                ),
                onChanged: bloc.changeEmail,
              ),
            ),
          ],
        );
      },
    );

  }

  

  //input de contraseña
  Widget _contrasena(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          children: [
            //contra texto
            Row(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                        begin: Alignment.topCenter, // Comienza desde la parte superior
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: const Text(
                      "Contraseña",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

            //input contra
            ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                    begin: Alignment.topCenter, // Comienza desde la parte superior
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: TextField(
                  obscureText: !_showPassword,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                        
                      },
                      icon: const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide( 
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),

                    //counterText: snapshot.data,
                    errorText:  snapshot.error != null ? snapshot.error.toString() : null,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.white,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),


                    
                  ),
                  onChanged: bloc.changePassword,
                ),
              ),
          ],
        );
      },
    );

  }

  //para ir a crear cuenta
  Widget _CrearCuenta(BuildContext context){
    return Column(
      children: [
        //crear cuenta
        Row(
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                  begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              child: Row(
                children: [
                  const Text(
                    "Inicia sesion o ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                  
                  InkWell(
                    child: const Text(
                      "Create una cuenta",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ), 
                ],
              )
            ),
          ],
        ),
      ],
    );

  }

  //boton para iniciar sesion
  Widget _BotonIniciar(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          children: [
            //boton
            Row(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                      begin: Alignment.topCenter, // Comienza desde la parte superior
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: ElevatedButton(
                    onPressed: snapshot.hasData ? (){_log(bloc, context);} : null ,

                      
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal:110.0 ,vertical: 15.0)
                    ),
                    child: const Text(
                      "Iniciar sesion",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0)
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
        
      },
    );

  }

  //verificar el inicio de sesion
  _log(LoginBloc bloc, BuildContext context) async {


    Map info = await usuarioProvide.login(bloc.email, bloc.password);

    if ( info['ok'] ){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Principal()),
      );
    }else{
      mostrarAlerta(context, "Credenciales incorrectas");
    }

  }
}