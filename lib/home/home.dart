import 'package:flutter/material.dart';
import 'package:formula_quiz/shared/shared.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //stream: AuthService().userStream,
      builder: (context, snapshot) {
        return const LoadingScreen();
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const LoadingScreen();
        // } else if (snapshot.hasError) {
        //   return const Center(
        //     child: ErrorMessage(),
        //   );
        // } else if (snapshot.hasData) {
        //   return const TopicsScreen();
        // } else {
        //   return const LoginScreen();
        // }
      },
    );
  }
}