import 'package:carrito/domain/controller/controladorAuth.dart';
import 'package:carrito/domain/controller/controladoruser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginf extends StatefulWidget {
  const Loginf({super.key});

  @override
  State<Loginf> createState() => _LoginfState();
}

class _LoginfState extends State<Loginf> {
  TextEditingController controluser = TextEditingController();
  TextEditingController controlpassw = TextEditingController();
  ControllerUser controlu = Get.find();
  Controllerauthf controlf = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 90,
                backgroundImage: NetworkImage(
                    "https://cengage.force.com/resource/1607465003000/loginIcon"),
              ),
              TextField(
                controller: controluser,
                decoration:
                    const InputDecoration(labelText: " Ingrese el usuario"),
              ),
              TextField(
                controller: controlpassw,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: " Ingrese la contraseña"),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controlf
                            .ingresarEmail(controluser.text, controlpassw.text)
                            .then((Value) {
                          if (controlf.getEmail != "Sin registro") {
                            Get.offAllNamed('/listarArticulos');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: "Validacion de usuarios",
                              message: "Usuario no existe BD",
                              icon: Icon(Icons.warning_amber_sharp),
                              backgroundColor: Colors.red,
                            ));
                          }
                        });
                      },
                      icon: const Icon(Icons.login)),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        controlf
                            .registraEmail(controluser.text, controlpassw.text)
                            .then((Value) {
                          if (controlf.getEmail != "Sin registro") {
                            Get.offAllNamed('/listarArticulos');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: "Validacion de usuarios",
                              message: "Usuario ya esta registrado",
                              icon: Icon(Icons.warning_amber_sharp),
                              backgroundColor:
                                  Color.fromARGB(255, 213, 136, 130),
                            ));
                          }
                        }).catchError((onError) {
                          Get.showSnackbar(const GetSnackBar(
                            title: "Validacion de usuarios",
                            message: "Usuario ya esta registrado",
                            icon: Icon(Icons.warning_amber_sharp),
                            backgroundColor: Color.fromARGB(255, 213, 136, 130),
                          ));
                        });
                      },
                      icon: const Icon(Icons.app_registration_rounded)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
