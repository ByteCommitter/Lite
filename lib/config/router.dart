import 'package:get/get.dart';
import 'package:hydlite/pages/MainScreen/base_widget.dart';
import 'package:hydlite/pages/auth/login_page.dart';
import 'package:hydlite/pages/auth/signup_page.dart';

class PageRoutes{
  var pages=[
    GetPage(name: '/', page: () => SignupPage()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/signup', page: () => SignupPage()),
    GetPage(name: '/base',page:()=>BaseScreen()),
    GetPage(name: '/checkin',page:()=>BaseScreen()),
    GetPage(name: '/profile',page:()=>BaseScreen()),
  ];
}

