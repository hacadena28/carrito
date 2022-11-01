import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlarCarrito extends GetxController {
  final _salchipapa = 0.obs;
  final _validacion = "".obs;

  int get getSalchipapa => _salchipapa.value;
  String get getValidacion => _validacion.value;

  addSalchipapa(context) {
    _salchipapa.value += 1;

    if (_salchipapa.value >= 10) {
      _salchipapa.value = 10;
      _validacion.value = "Has sobrepasado el limite de 10 productos";
      return showDialog<void>(
        context: context,
        builder: (_) => _alerta(
            "Alerta", "Has sobrepasado el limite de 10 Productos", context),
      );
    } else {
      _validacion.value = "";
    }
  }

  removeSalchipapa(context) {
    _salchipapa.value -= 1;

    if (_salchipapa.value < 0) {
      _salchipapa.value = 0;
      _validacion.value = "No puedes eliminar mas productos";
      return showDialog<void>(
        context: context,
        builder: (_) =>
            _alerta("Alerta", "No puedes eliminar mas productos", context),
      );
    } else {
      _validacion.value = "";
    }
  }
}

Widget _alerta(titulo, texto, context) {
  return AlertDialog(
    title: Text(titulo),
    content: Text(texto),
    actions: <Widget>[
      TextButton(
        child: Text("Aceptar"),
        style: TextButton.styleFrom(
          foregroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
