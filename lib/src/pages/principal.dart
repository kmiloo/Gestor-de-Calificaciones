import 'package:flutter/material.dart';
import 'package:gestor_calificaciones/src/models/producto_model.dart';
import 'package:gestor_calificaciones/src/pages/asignatura.dart';
import 'package:gestor_calificaciones/src/providers/productos_providers.dart';

class Principal extends StatefulWidget {

  @override
  State<Principal> createState() => _principalState();
}

class _principalState extends State<Principal> {
  final formKey = GlobalKey<FormState>();

  ProductoModel producto = new ProductoModel();

  final productoprovider = ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asignaturas'),
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
      


      body: Column(
          children: [
            // Agrega cualquier contenido adicional que desees antes o después del listado
            // Puedes incluir imágenes, textos, botones, etc.
            
            // Imagen logo
            Image.asset(
              "assets/logo_transparent.png",
              height: 250,
            ),

            // Listado de productos
              
              Expanded(
              
                child: _crearListado(),
              ),
            
            



            // Botón para agregar nueva asignatura
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical:25 ,horizontal: 25),
                    child: FloatingActionButton(
                    backgroundColor: Color.fromRGBO(64, 224, 208, 1),
                    onPressed: () {
                      _mostrarFormulario(context); // Llamada a la función para mostrar el formulario
                    },
                    child: const Icon(Icons.add),
                  ),
                )

              ],
            ),
            
          ],
        ),
      );
  }


  Widget _crearListado() {
    return FutureBuilder(
      future: productoprovider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return Container(


              child: ListView.builder(
              itemCount: productos?.length,
              itemBuilder: (context, index) {
                return Column(
                    children: [
                      _crearItem(productos![index]),
                      _separador()
                    ],
                    
                  );

              }
            ),
        
    
              
          );
        } else {
          return Center(
            child: Column(
              children: [
                Text("Agrege asignaturas"),
                SizedBox(height: 16,),
                CircularProgressIndicator(),
              ],
            )
          );
        }
      },
    );
  }

  Widget _crearItem(ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        //borrar producto
        productoprovider.borrarProducto(producto.id!);
      },
      child: ListTile(
        autofocus: true,
        
        title: Text("               ${producto.titulo}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Asignatura(producto)),
          );
        },
        

      )
    );
  }


  void _mostrarFormulario(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ingrese el nombre de la asignatura'),
          content: SizedBox(
            height: 120, 
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _crearNombre(),
                  //_crearDisponible(),
                  
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

              },
              child: Text('Cancelar'),
            ),
            _crearBoton(context),
          ],
        );
      },
    );
  }


  void _submit (BuildContext context){
    
    if(!formKey.currentState!.validate()) return;

    formKey.currentState?.save();

    //print(producto.titulo);

    productoprovider.crearProducto(producto);
    setState(() {});
    Navigator.of(context).pop();
    

  }

  Widget _crearNombre(){
    return TextFormField(
      initialValue: producto.titulo,
      decoration: InputDecoration(labelText: 'Nombre:'),
      onSaved: (value) => producto.titulo = value! ,
      validator: (value) {
        if (value!.length < 3){
          return 'Ingrese el nombre de la asignatura';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearBoton(BuildContext context){
    return TextButton(
      onPressed: () {

        _submit(context);


      },
      child: Text('Guardar'),
    );

  }

  Widget _separador(){
    return SizedBox(
      
      width: 250,
      height: 2,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Color.fromRGBO(67, 65, 198, 1), Color.fromRGBO(17, 169, 189, 1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds);
        },
        child: ElevatedButton(onPressed: () {}, child: const Text("")),
      ),
    );
  }

 
}
