import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart'; // Gerado pelo FlutterFire

import 'package:myapp/controller/auth_controller.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/view/auth_gate.dart';

void main() async {
  // Garante que o Flutter está inicializado
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa o Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Injeta o AuthController na memória para ser usado em todo o app
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp é a versão do GetX para o MaterialApp
    return GetMaterialApp(
      title: 'BookShelf',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
          primary: Colors.blueGrey.shade700,
          // Cor de destaque para o ícone de favorito
          secondary: Colors.amber.shade800,
        ),
        scaffoldBackgroundColor: Colors.grey.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey.shade800,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey.shade700,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.amber.shade800,
          unselectedItemColor: Colors.blueGrey.shade300,
          backgroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // A tela inicial é o nosso portão de autenticação
      home: AuthGate(), // Use the corrected AuthGate
      // Define as rotas do aplicativo
      getPages: AppRoutes.routes, // Use the corrected AppRoutes
    );
  }
}
