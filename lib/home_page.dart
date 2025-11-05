import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.greenAccent,
        title: Text("My Flutter Project"),
      ),
    );
  }
}
