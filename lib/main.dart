import 'package:flutter/material.dart';

void main() {
  runApp(const LecturasApp());
}

class LecturasApp extends StatelessWidget {
  const LecturasApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos el estilo de fuente Comic para reutilizarlo
    const comicTextStyle = TextStyle(
      fontFamily: 'Comic Sans MS', // Asegúrate de tener esta fuente configurada en pubspec.yaml o usa una similar por defecto del sistema si está disponible
      color: Colors.black,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lecturas-Andrea Roldan 6-I',
      theme: ThemeData(
        // Fondo de toda la aplicación de color negro
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          // Barra de color azul claro
          backgroundColor: const Color(0xFFADD8E6), // LightBlue
          // Nombre de la app en negro y con letra de comic
          title: const Text(
            'Lecturas-Andrea Roldan 6-I',
            style: comicTextStyle,
          ),
          centerTitle: true,
        ),
        // GridView de 2 columnas por 7 filas (14 imágenes en total)
        body: GridView.count(
          crossAxisCount: 2, // 2 columnas
          // Ajusta la proporción de aspecto para que quepan las 7 filas cómodamente
          childAspectRatio: 1, // Ajusta este valor según sea necesario para la altura de la fila
          children: [
            // Sección de 14 elementos de lectura
            buildLecturaCard(
                'El Quijote',
                'Cervantes',
                4,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap.JPG'),
            buildLecturaCard(
                'Cien años de soledad',
                'García Márquez',
                5,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap2.JPG'),
            buildLecturaCard(
                '1984',
                'George Orwell',
                5,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap3.JPG'),
            buildLecturaCard(
                'Fahrenheit 451',
                'Ray Bradbury',
                4,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap4.JPG'),
            buildLecturaCard(
                'La Odisea',
                'Homero',
                5,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap5.JPG'),
            buildLecturaCard(
                'El principito',
                'Saint-Exupéry',
                5,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap6.JPG'),
            buildLecturaCard(
                'Don Juan Tenorio',
                'Zorrilla',
                4,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap7.JPG'),
            buildLecturaCard(
                'Crónica de una muerte anunciada',
                'García Márquez',
                5,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap8.JPG'),
            buildLecturaCard(
                'El túnel',
                'Sábato',
                4,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap9.JPG'),
            buildLecturaCard(
                'Rayuela',
                'Cortázar',
                5,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap10.JPG'),
            buildLecturaCard(
                'La ciudad y los perros',
                'Vargas Llosa',
                4,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap11.JPG'),
            buildLecturaCard(
                'Pedro Páramo',
                'Juan Rulfo',
                5,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap12.JPG'),
            buildLecturaCard(
                'Los miserables',
                'Víctor Hugo',
                5,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap13.JPG'),
            buildLecturaCard(
                'La metamorfosis',
                'Kafka',
                4,
                'https://raw.githubusercontent.com/RoldanOrtega/UII-Act-5-GridView/refs/heads/main/cap14.JPG'),
          ],
        ),
      ),
    );
  }

  // Función para construir cada recuadro de lectura
  Widget buildLecturaCard(
      String titulo, String subtitulo, int estrellas, String imageUrl) {
    // Definimos el estilo de fuente Comic para la información dentro del recuadro
    const comicTextStyle = TextStyle(
      fontFamily: 'Comic Sans MS',
      color: Colors.black, // Info de color negro
    );

    return Container(
      // Cada recuadro será de color azul claro
      color: const Color(0xFFADD8E6), // LightBlue
      margin: const EdgeInsets.all(8.0), // Margen para separar recuadros
      child: Container(
        // Margen led de color azul obscuro
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF00008B), // DarkBlue
            width: 4.0, // Ancho del margen led
          ),
        ),
        child: Column(
          children: [
            // Imagen desde GitHub (usando identicons como ejemplo)
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover, // Ajusta la imagen al recuadro
              ),
            ),
            // Tres filas de información en la parte inferior
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fila 1: Título
                  Text(
                    titulo,
                    style: comicTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  // Fila 2: Subtítulo
                  Text(
                    subtitulo,
                    style: comicTextStyle.copyWith(fontSize: 14.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  // Fila 3: Estrellitas
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < estrellas ? Icons.star : Icons.star_border,
                        // Estrellas de un azul diferente al color de fondo y led (ej. azul rey)
                        color: const Color(0xFF4169E1), // RoyalBlue
                        size: 20.0,
                      );
                    }),
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