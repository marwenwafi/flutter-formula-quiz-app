import 'package:flutter/material.dart';
import 'package:formula_quiz/shared/shared.dart';
import 'package:formula_quiz/services/services.dart';
import 'package:formula_quiz/login/login.dart';
import 'package:formula_quiz/categories/categories.dart';




class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return const CategoriesScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}