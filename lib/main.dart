import 'package:flutter/material.dart';

void main() {
  runApp(Flutterton());
}

class Flutterton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
      title: 'Official website for the village of Flutterton',
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Fuck!');
  }
}
