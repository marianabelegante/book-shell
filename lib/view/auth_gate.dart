import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view/home_view.dart';
import 'package:myapp/controller/auth_controller.dart';
import 'package:myapp/view/login_view.dart';

class AuthGate extends StatelessWidget {
  final AuthController authController = Get.find();

  AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // Obx é um widget do GetX que reconstrói a UI quando uma variável .obs muda
    return Obx(() {      // Se o valor do usuário for nulo, mostra a tela de login, senão, a home
      return authController.user == null ? LoginView() : HomeView();    });
  }
}