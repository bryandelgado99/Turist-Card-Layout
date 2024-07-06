// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = "Card Examples";
  final String text = loremIpsum(words: 150, paragraphs: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > constraints.maxHeight;
        
            return Center(
              child: isWideScreen
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildCards(),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildCards(),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildCards() {
    return [
      CardInfo(
        name: "Panecillo",
        location: "Quito, Pichincha - Ecuador",
        description: text,
        imagePath: 'images/panecillo.png',
      ),
      CardInfo(
        name: "Malecon 2000",
        location: "Guayaquil, Guayas - Ecuador",
        description: text,
        imagePath: 'images/malecon.jpg',
      ),
      CardInfo(
        name: "Báscilica del Voto Nacional",
        location: "Quito, Pichincha - Ecuador",
        description: text,
        imagePath: 'images/basilica.jpg',
      ),
      CardInfo(
        name: "Cuenca",
        location: "Azuay, Ecuador",
        description: text,
        imagePath: 'images/cueenca.jpg',
      ),
      CardInfo(
        name: "Riobamba",
        location: "Chimborazo, Ecuador",
        description: text,
        imagePath: 'images/riobamba.jpg',
      ),
    ];
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.name, required this.location, required this.description, required this.imagePath});

  final String name;
  final String location;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 200, // Altura fija del contenedor
                minWidth: 300, // Ancho que se expande al máximo
              ),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          TitleSection(name: name, location: location),
          const ButtonSection(),
          TextSection(description: description)
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    int random(int min, int max) {
      return min + Random().nextInt(max - min);
    }

    String scored = random(1, 100).toString();

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600), // Agregamos restricciones aquí
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(location, style: TextStyle(color: Colors.grey[500])),
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                const SizedBox(width: 10),
                Text(scored),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonText(
              label: "Enviar mensaje",
              color: Colors.deepPurple,
              icon: Icons.send_rounded),
          ButtonText(
              label: "Guardar",
              color: Colors.deepPurple,
              icon: Icons.save_rounded),
          ButtonText(
              label: "Compartir",
              color: Colors.deepPurple,
              icon: Icons.share_rounded),
        ],
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.label, required this.color, required this.icon});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(color),
      ),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        description,
        textAlign: TextAlign.justify,
      ),
    );
  }
}