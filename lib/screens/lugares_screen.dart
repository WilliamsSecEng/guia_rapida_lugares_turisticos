// Importa los paquetes y archivos necesarios
import 'package:flutter/material.dart';
import '../models/lugar.dart'; // Modelo de datos Lugar
import '../data/lugares.dart'; // Lista de lugares
import 'detail_screen.dart'; // Pantalla de detalle

// Pantalla que muestra los lugares turísticos de una región específica
class LugaresScreen extends StatelessWidget {
  final String region; // Región seleccionada

  // Constructor que recibe la región
  const LugaresScreen({required this.region});

  @override
  Widget build(BuildContext context) {
    // Filtra los lugares según la región seleccionada
    final List<Lugar> lugaresFiltrados = lugares
        .where((lugar) => lugar.region.toLowerCase() == region.toLowerCase())
        .toList();

    // Estructura principal de la pantalla
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Color del icono de retroceso
        // Título dinámico según la región
        title: Text('Lugares en la region $region',
            style: TextStyle(color:Colors.white,fontSize: 24, fontWeight: FontWeight.bold)),
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
      // Lista de lugares filtrados
      body: ListView.builder(
        padding: EdgeInsets.all(16), // Espaciado alrededor de la lista
        itemCount: lugaresFiltrados.length, // Número de lugares
        itemBuilder: (context, index) {
          final lugar = lugaresFiltrados[index]; // Lugar actual

          return Card(
            elevation: 4, // Sombra de la tarjeta
            margin: EdgeInsets.only(bottom: 16), // Espacio entre tarjetas
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Bordes redondeados
            child: InkWell(
              // Acción al tocar la tarjeta
              onTap: () {
                // Navega a la pantalla de detalle, pasando el lugar seleccionado
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(lugar: lugar),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagen del lugar con bordes redondeados arriba
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      lugar.imagen,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Información textual del lugar
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nombre del lugar
                        Text(
                          lugar.nombre,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4), // Espacio entre nombre y descripción
                        // Descripción corta del lugar
                        Text(
                          lugar.descripcion,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
