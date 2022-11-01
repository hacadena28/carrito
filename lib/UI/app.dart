import 'package:carrito/UI/Pages/producto.dart';
import 'package:carrito/UI/Pages/carrito.dart';
import 'package:carrito/UI/auth/login.dart';
import 'package:carrito/UI/authf/loginf.dart';
import 'package:carrito/UI/content/articulos/crear.dart';
import 'package:carrito/UI/content/articulos/listar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Carrito de compras",
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const Login(),
        '/loginf': (context) => const Loginf(),
        '/productos': (context) => const Producto(),
        '/carrito': (context) => const Carrito(),
        '/articuloAdd': (context) => const AddArticulos(),
        '/listarArticulos': (context) => const ListArticulos(),
      },
      home: const Loginf(),
    );
  }
}
