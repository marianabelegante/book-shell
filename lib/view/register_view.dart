import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_shelf/controller/auth_controller.dart';

class RegisterView extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Conta')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Crie sua conta',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headlineSmall,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      (value) =>
                          (value == null || !GetUtils.isEmail(value))
                              ? 'E-mail inválido'
                              : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator:
                      (value) =>
                          (value == null || value.length < 6)
                              ? 'A senha deve ter no mínimo 6 caracteres'
                              : null,
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return _authController.errorMessage.isNotEmpty
                      ? Text(
                        _authController.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      )
                      : const SizedBox.shrink();
                }),
                const SizedBox(height: 16),
                Obx(() {
                  return _authController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _authController
                                .signUp(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                )
                                .then((_) {
                                  // Se o cadastro der certo, o AuthGate já vai redirecionar
                                  if (_authController.user != null) {
                                    Get.back(); // Volta para a tela anterior (login)
                                  }
                                });
                          }
                        },
                        child: const Text('Cadastrar'),
                      );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
