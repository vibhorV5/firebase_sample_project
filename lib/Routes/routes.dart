import 'package:firebase_sample_project/Screens/AuthGate/View/auth_gate.dart';
import 'package:firebase_sample_project/Screens/Home/View/home_screen.dart';
import 'package:firebase_sample_project/Screens/LoginRegistration/View/login_screen.dart';
import 'package:get/get.dart';

const String authgate = '/authgate';
const String home = '/homeScreen';
const String loginScreen = '/loginScreen';

class Routes {
  static final routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: loginScreen, page: () => const LogInScreen()),
    GetPage(name: authgate, page: () => const AuthGate()),
  ];
}
