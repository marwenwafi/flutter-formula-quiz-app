import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formula_quiz/routes.dart';
import 'package:formula_quiz/services/services.dart';
import 'package:formula_quiz/shared/shared.dart';
import 'package:formula_quiz/theme.dart';
import 'package:provider/provider.dart';




void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  


  runApp(const App());
    debugPrint("helllooooooooooooooooo************************************");

    // final List<Category> categories = await supabaseService.getCategories();
    //   debugPrint('Data');
    // debugPrint(categories.toString());
    
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

    final Future<Supabase> supabase =  Supabase.initialize( url: dotenv.get('SUPABASE_URL'), anonKey: dotenv.get('SUPABASE_ANON_KEY'));

   

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: supabase,
      builder: (context, snapshot) {
        return MaterialApp(
                debugShowCheckedModeBanner: true,
                routes: appRoutes,
                theme: appTheme);
        // Check for errors
        // if (snapshot.hasError) {
        //   // Error screen
        // }

        // //Once complete, show your application
        // if (snapshot.connectionState == ConnectionState.done) {
          
        // }
        // // Otherwise, show something whilst waiting for initialization to complete
        // return const MaterialApp(home: LoadingScreen());
      },
    );
  }
}
