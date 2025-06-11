import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/auth_controller.dart';


class LoginView extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.menu_book,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Bem-vindo ao BookShelf',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headlineSmall,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      (value) =>
                          (value == null || !value.isEmail)
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
                              ? 'Mínimo 6 caracteres'
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
                            _authController.signIn(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );
                          }
                        },
                        child: const Text('Login'),
                      );
                }),
                TextButton(
                  onPressed: () => Get.toNamed('/register'),
                  child: const Text('Não tem uma conta? Cadastre-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
