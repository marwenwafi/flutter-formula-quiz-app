import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:formula_quiz/about/about.dart';
import 'package:formula_quiz/home/view/bottom_nav_bar.dart';
import 'package:formula_quiz/profile/profile.dart';
import 'package:formula_quiz/topics/topics.dart';

class HomePage extends StatelessWidget {
  const HomePage._();

  static Page<void> page() => const MaterialPage<void>(
        key: ValueKey('home_page'),
        child: HomePage._(),
      );

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => NavBarController(),
      child: const Scaffold(
        body: HomeBody(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: context.watch<NavBarController>(),
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        TopicsFlow(),
        AboutView(),
        ProfileView(),
      ],
    );
  }
}
