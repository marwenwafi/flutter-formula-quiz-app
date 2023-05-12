import 'package:flutter/material.dart';
import 'package:formula_quiz/routes.dart';
import 'package:formula_quiz/services/services.dart';
import 'package:formula_quiz/shared/shared.dart';
import 'package:formula_quiz/theme.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
     return const MaterialApp(home: LoadingScreen());
    // return FutureBuilder(
    //   // Initialize FlutterFire:
    //   future: _initialization,
    //   builder: (context, snapshot) {
    //     // Check for errors
    //     if (snapshot.hasError) {
    //       // Error screen
    //     }

    //     // Once complete, show your application
    //     // if (snapshot.connectionState == ConnectionState.done) {
    //     //   return StreamProvider(
    //     //     create: (_) => FirestoreService().streamReport(),
    //     //     catchError: (_, err) => Report(),
    //     //     initialData: Report(),
    //     //     child: MaterialApp(
    //     //         debugShowCheckedModeBanner: true,
    //     //         routes: appRoutes,
    //     //         theme: appTheme),
    //     //   );
    //     // }

    //     // Otherwise, show something whilst waiting for initialization to complete
    //     return const MaterialApp(home: LoadingScreen());
    //   },
    // );
  }
}
