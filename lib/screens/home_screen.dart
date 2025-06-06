// Importa los paquetes necesarios de Flutter para construir la interfaz de usuario
import 'package:flutter/material.dart';
// Importa la pantalla de lugares turísticos
import 'lugares_screen.dart'; // Importa la pantalla siguiente

// Define la clase principal de la pantalla de inicio, que es inmutable (StatelessWidget)
class HomeScreen extends StatelessWidget {
  // Lista de regiones que se mostrarán en la pantalla
  final List<String> regiones = ['Andina', 'Sub-Andina', 'Llanos'];

  // Mapa que asocia cada región con la ruta de su imagen
  final Map<String, String> imagenesRegiones = {
    'Andina': '../assets/images/andino.jpg',
    'Sub-Andina': '../assets/images/subandino.jpg',
    'Llanos': '../assets/images/llanos.jpg',
  };

  @override
  Widget build(BuildContext context) {
    // Estructura principal de la pantalla
    return Scaffold(
      // Barra superior de la aplicación
      appBar: AppBar(
        // Logo a la izquierda de la barra superior
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            '../assets/icons/logoH.png', // Cambia la ruta si tu logo está en otro lugar
            fit: BoxFit.contain,
          ),
        ),
        // Título de la barra superior
        title: Text('Explora Tu País',
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
      // Cuerpo de la pantalla
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Espaciado alrededor del contenido
        child: ListView.builder(
          itemCount: regiones.length, // Número de elementos en la lista
          itemBuilder: (context, index) {
            final region = regiones[index]; // Obtiene la región actual
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10), // Margen vertical entre tarjetas
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Bordes redondeados
              elevation: 4, // Sombra de la tarjeta
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  // Navega a la pantalla de lugares turísticos, pasando la región seleccionada
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LugaresScreen(region: region),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Imagen encima del nombre de la región
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        imagenesRegiones[region] ?? 'assets/images/default.jpg',
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            region,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
