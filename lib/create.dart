import 'package:flutter/material.dart';

class NewRowPage extends StatefulWidget {
  @override
  _NewRowPageState createState() => _NewRowPageState();
}

class _NewRowPageState extends State<NewRowPage> {
  TextEditingController codigoController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Nueva Fila'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: codigoController,
              decoration: InputDecoration(labelText: 'Código'),
            ),
            TextField(
              controller: tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            ElevatedButton(
              onPressed: () {
                // Create a new row with the entered data
                final newRow = [
                  codigoController.text,
                  tituloController.text,
                  descripcionController.text,
                  false, // Default 'Terminado' value
                ];

                // Pass the new row back to the previous page
                Navigator.of(context).pop(newRow);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
