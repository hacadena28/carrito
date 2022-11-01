import 'package:carrito/domain/controller/controladoruser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controluser = TextEditingController();
  TextEditingController controlpassw = TextEditingController();
  ControllerUser controlu = Get.find();
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
                        controlu
                            .enviaruser(controluser.text, controlpassw.text)
                            .then((Value) {
                          if (controlu.listauser!.isNotEmpty == true) {
                            Get.offAllNamed('/productos');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: "Validacion de usuarios",
                              message: "Usuario no existe en la base de datos",
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
                      onPressed: () {},
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
