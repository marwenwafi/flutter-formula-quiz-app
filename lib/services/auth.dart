import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');


class AuthService {
  final SupabaseClient client = Supabase.instance.client;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Session? session;
  User? user;
  
  //AuthService(this.client);

  Future<void> signInUser(String email, String password) async {
    
    final AuthResponse res = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
//        prefs.setString("session_token", value) session = res.session;

    session = res.session;
    user = res.user;
  }

  Future<void> signInOtp(String email) async {
    await client.auth.signInWithOtp(email: email);
  }

  Future<void> signInWithGoogle() async {
    //authScreenLaunchMode: LaunchMode.externalApplication
    await client.auth.signInWithOAuth(Provider.google,redirectTo: kIsWeb ? null : dotenv.get('SUPABASE_REDIRECT_URL'));
  }

  Future<void> verifyOtp({required String userEmail, required String otp}) async {
    final AuthResponse res = await client.auth.verifyOTP(email: userEmail, token: otp, type: OtpType.magiclink);
    final Session? session = res.session;
    final User? user = res.user;
  }

  Future<void> signOutUser () async {
    await client.auth.signOut();
  }

  Stream<AuthState> listenToAuthStatus() {
    final authStateChangeStream = client.auth.onAuthStateChange;
    StreamSubscription<AuthState> authSubscription = authStateChangeStream.listen((data) { 
      debugPrint('Event value: ${data}');

      switch (data.event) { 
        case AuthChangeEvent.signedOut :
          // TODO: handle when user is signed out
          break;
        case AuthChangeEvent.passwordRecovery:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.signedIn:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.tokenRefreshed:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.userUpdated:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.userDeleted:
          // TODO: Handle this case.
          break;
        case AuthChangeEvent.mfaChallengeVerified:
          // TODO: Handle this case.
          break;
      }
    });

    return authStateChangeStream;
  }

  bool isLoggedIn(){
    return client.auth.currentSession != null;
  }

}