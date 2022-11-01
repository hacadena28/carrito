import 'package:carrito/UI/app.dart';
import 'package:flutter/material.dart';

class ListArticulos extends StatelessWidget {
  const ListArticulos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(title: const Text("Lista de articulos"),
      ),
    );
  }
}
