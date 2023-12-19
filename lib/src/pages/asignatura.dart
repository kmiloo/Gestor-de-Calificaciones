import 'package:flutter/material.dart';
import 'package:gestor_calificaciones/src/models/producto_model.dart';

class Asignatura extends StatefulWidget {
  final ProductoModel producto;

  const Asignatura(this.producto, {Key? key}) : super(key: key);

  @override
  _AsignaturaState createState() => _AsignaturaState();
}

class _AsignaturaState extends State<Asignatura> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(64, 224, 208, 1),
          
          // Añade un botón de retroceso en la AppBar
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navega hacia atrás cuando se presiona el botón
              Navigator.of(context).pop();
            },
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              // imagen logo
              Image.asset(
                "assets/logo_transparent.png",
                height: 250,
              ),
              //texto de asignaturas
              Row(
                children: [
                  SizedBox(width: 30),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
                          begin: Alignment.topCenter, 
                          end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: Text(
                      //\n
                      "Asignatura: ${widget.producto.titulo}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  SizedBox(width: 275,height: 30),
                ],
              ),
              SizedBox(height: 2),
              _notas("Nota 1", nota1Controller),
              _notas("Nota 2", nota2Controller),
              _notas("Nota 3", nota3Controller),
              Row(children: [SizedBox(width: 217), _botonMas()],),
              _promedio(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _notas(String nota, TextEditingController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nota),
            SizedBox(width: 120),
            SizedBox(
              width: 40,
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0)),
                child: TextField(controller: controller, keyboardType: TextInputType.number),
              ),
            ),
            SizedBox(width: 15),
            //Icon(Icons.close),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _botonMas() {
    return Container(
      width: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color.fromRGBO(64, 224, 208, 1)),
        onPressed: () {
          _calcularPromedio();
        },
        child: Text("Calcular"),
      ),
    );
  }

  void _calcularPromedio() {
    double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;
    double nota3 = double.tryParse(nota3Controller.text) ?? 0.0;

    double promedio = (nota1 + nota2 + nota3) / 3;

    // Actualizar el estado para que se vuelva a construir con el nuevo promedio
    setState(() {});
  }

  Widget _promedio() {
  double nota1 = double.tryParse(nota1Controller.text) ?? 0.0;
  double nota2 = double.tryParse(nota2Controller.text) ?? 0.0;
  double nota3 = double.tryParse(nota3Controller.text) ?? 0.0;

  double promedio = (nota1 + nota2 + nota3) / 3;

  return Container(
    height: 200,
    width: 300,
    color: const Color.fromARGB(97, 255, 193, 7),
    padding: const EdgeInsets.symmetric(vertical: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Promedio de notas:"),
            Text(promedio.toStringAsFixed(1)),
          ],
        )
      ],
    ),
  );
}
}
