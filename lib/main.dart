import 'package:carrito/UI/app.dart';
import 'package:carrito/domain/controller/controladorAuth.dart';
import 'package:carrito/domain/controller/controladorCarrito.dart';
import 'package:carrito/domain/controller/controladoruser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ControlarCarrito());
  Get.put(Controllerauthf());
  Get.put(ControllerUser());
  runApp(const App());
}
