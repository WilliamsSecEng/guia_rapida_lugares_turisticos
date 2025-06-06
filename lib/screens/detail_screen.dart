import 'package:flutter/material.dart';
import '../models/lugar.dart';

class DetailScreen extends StatelessWidget {
  final Lugar lugar;

  const DetailScreen({required this.lugar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Color del icono de retroceso
        title: Text(lugar.nombre,style: TextStyle(color:Colors.white,fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true, // Centra el título
        backgroundColor: Colors.blue, // Color de fondo de la barra
        shadowColor: Colors.grey, // Color de la sombra de la barra
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF4C60AF),
              Color.fromARGB(255, 73, 195, 248)
            ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              lugar.imagen,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lugar.nombre,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Chip(
                    label: Text(lugar.tipo),
                    backgroundColor: Colors.teal.shade100,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Descripción:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    lugar.descripcion,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Clima Ideal:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    lugar.clima,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Actividades:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: lugar.actividades.map((actividad) {
                      return Chip(
                        label: Text(actividad),
                        backgroundColor: Colors.teal.shade50,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
