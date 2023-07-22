import 'package:flutter/material.dart';
import 'package:formula_quiz/shared/shared.dart';
import 'package:formula_quiz/services/services.dart';
import 'package:formula_quiz/login/login.dart';
import 'package:formula_quiz/categories/categories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: AuthService().listenToAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
          
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData && (snapshot.data?.event == AuthChangeEvent.signedIn)) {
          return const CategoriesScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}