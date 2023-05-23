import 'package:formula_quiz/categories/categories.dart';
import 'package:formula_quiz/home/home.dart';
import 'package:formula_quiz/login/login.dart';
//import 'package:formula_quiz/login/otpLogin.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/categories': (context) => const CategoriesScreen(),
  //'/otplogin': (context) => const OtpLoginScreen(),
  // '/profile': (context) => const ProfileScreen(),
  // '/about': (context) => const AboutScreen(),
};