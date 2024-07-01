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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = "Card Examples";
  final String text = loremIpsum(words: 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardInfo(name: "Panecillo", location: "Quito, Ecuador", description: text),
              CardInfo(name: "Malecon 2000", location: "Guayaquil, Ecuador", description: text),
              CardInfo(name: "Báscilica del Voto Nacional", location: "Quito, Ecuador", description: text),
              CardInfo(name: "Nueva Prosperina", location: "Guayaquil, Ecuador", description: text),
              CardInfo(name: "La Colmena", location: "Quito, Ecuador", description: text),
            ],
          ),
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.name, required this.location, required this.description});

  final String name;
  final String location;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ImageCard(),
          TitleSection(name: name, location: location),
          const buttonSection(),
          TextSection(description: description)
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/mge.jpg");
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

    String scored =  random(1, 100).toString();

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Row(
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
                  )
              ),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const SizedBox(
                width: 10,
              ),
              Text(scored)
            ],
          ),
        ],
      ),
    );
  }
}

class buttonSection extends StatelessWidget {
  const buttonSection({super.key});

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
  const ButtonText(
      {super.key,
      required this.label,
      required this.color,
      required this.icon});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(height: 5,),
        Text(label, style: TextStyle(color: color))
      ],
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
