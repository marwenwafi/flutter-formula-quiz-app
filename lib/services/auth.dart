import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  final SupabaseClient client = Supabase.instance.client;
  Session? session;
  User? user;
  
  //AuthService(this.client);

  Future<void> signInUser(String email, String password) async {
    final AuthResponse res = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    session = res.session;
    user = res.user;
  }

  Future<void> signInOtp(String email) async {
    await client.auth.signInWithOtp(email: email);
  }

  Future<void> signInWithGoogle() async {
    await client.auth.signInWithOAuth(Provider.github);
  }

  Future<void> verifyOtp({required String userEmail, required String otp}) async {
    final AuthResponse res = await client.auth.verifyOTP(email: userEmail, token: otp, type: OtpType.magiclink);
    final Session? session = res.session;
    final User? user = res.user;
  }

  Future<void> signOutUser () async {
    await client.auth.signOut();
  }

  Stream<Object> listenToAuthStatus() {
    StreamSubscription<AuthState> authSubscription = client.auth.onAuthStateChange.listen((data) { 
      final Session? session = data. session;
      final AuthChangeEvent event = data. event;
      switch (event) { 
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
    StreamController<Object> controller = StreamController<Object>();

    authSubscription.onData((AuthState data) {
      controller.add(data);
    });

    authSubscription.onError((error) {
      controller.addError(error);
    });

    authSubscription.onDone(() {
      controller.close();
    });

    return controller.stream.asyncExpand((event) => Stream<Object>.value(event));
  }

  bool isLoggedIn(){
    return client.auth.currentSession != null;
  }

}