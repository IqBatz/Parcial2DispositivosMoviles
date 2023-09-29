import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<List<dynamic>> data = [
    ["T01", "Análisis de requerimientos", "Análisis de requerimientos de la última reunión", true],
    ["T02", "Diseño de la aplicación", "Diseño de la interfaz de usuario", false],
    ["T03", "Implementación de funciones", "Desarrollo de las funciones principales", false],
    ["T04", "Pruebas de calidad", "Pruebas unitarias y de integración", false],
    ["T05", "Documentación", "Creación de documentación técnica", false],
    ["T06", "Revisión final", "Revisión y aprobación del proyecto", false],
    ["T07", "Lanzamiento", "Lanzamiento de la aplicación al público", false],
    ["T08", "Soporte y mantenimiento", "Soporte continuo y actualizaciones", false],
    ["T09", "Evaluación del proyecto", "Evaluación del éxito del proyecto", false],
    ["T10", "Informe final", "Preparación del informe final", false],
  ];

  final TextEditingController codigoController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();

  void _crearNuevaFila() {
    final newRow = [
      codigoController.text,
      tituloController.text,
      descripcionController.text,
      false,
    ];

    setState(() {
      data.add(newRow);
    });

    // Clear the text fields after adding a new row
    codigoController.clear();
    tituloController.clear();
    descripcionController.clear();
  }

  void _eliminarDato(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Parcial2'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
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
                    onPressed: _crearNuevaFila,
                    child: Text('Crear Nueva Fila'),
                  ),
                ],
              ),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Código')),
                DataColumn(label: Text('Título')),
                DataColumn(label: Text('Descripción')),
                DataColumn(label: Text('Terminado')),
                DataColumn(label: Text('Eliminar')),
              ],
              rows: data.asMap().entries.map((entry) {
                final index = entry.key;
                final row = entry.value;

                return DataRow(
                  cells: [
                    DataCell(Text(row[0])),
                    DataCell(Text(row[1])),
                    DataCell(Text(row[2])),
                    DataCell(
                      Checkbox(
                        value: row[3],
                        onChanged: (bool? value) {
                          setState(() {
                            row[3] = value;
                          });
                        },
                      ),
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _eliminarDato(index);
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
