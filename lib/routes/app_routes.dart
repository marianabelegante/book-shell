import 'package:get/get.dart';
import 'package:myapp/view/login_view.dart';
import 'package:myapp/view/register_view.dart';
import 'package:myapp/view/home_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/login', page: () => LoginView()),
    GetPage(name: '/register', page: () => RegisterView()),
    GetPage(name: '/home', page: () => HomeView()),
  ];
}
