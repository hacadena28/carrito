import 'package:carrito/UI/Pages/carrito.dart';
import 'package:carrito/domain/controller/controladorCarrito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Producto extends StatelessWidget {
  const Producto({super.key});

  @override
  Widget build(BuildContext context) {
    ControlarCarrito controlCarrito = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de productos"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const Carrito());
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    controlCarrito.removeSalchipapa(context);
                  },
                  icon: Icon(Icons.remove_circle)),
              const Text("Salchipapa Familiar"),
              IconButton(
                  onPressed: () {
                    controlCarrito.addSalchipapa(context);
                  },
                  icon: Icon(Icons.add_circle)),
              Obx(() => Text('${controlCarrito.getSalchipapa}')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Obx(() => Text('${controlCarrito.getValidacion}'))],
          )
        ],
      ),
    );
  }
}
