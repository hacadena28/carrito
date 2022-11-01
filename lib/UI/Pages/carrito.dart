import 'package:carrito/UI/app.dart';
import 'package:carrito/domain/controller/controladorCarrito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Carrito extends StatelessWidget {
  const Carrito({super.key});

  @override
  Widget build(BuildContext context) {
    ControlarCarrito controlCarrito = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facturacion"),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Salchipapa Familiar"),
            Text("${controlCarrito.getSalchipapa}"),
          ],
        )
      ]),
    );
  }
}
