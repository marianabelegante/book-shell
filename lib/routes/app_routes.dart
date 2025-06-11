import 'package:get/get.dart';
import '/lib/view/login_view.dart';
import '/lib/view/register_view.dart';
import '/lib/view/home_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/login', page: () => LoginView()),
    GetPage(name: '/register', page: () => RegisterView()),
    GetPage(name: '/home', page: () => HomeView()),
  ];
}
