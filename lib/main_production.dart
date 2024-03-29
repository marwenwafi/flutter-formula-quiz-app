import 'package:api_client/api_client.dart';
import 'package:formula_quiz/app/app.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  await bootstrap(
    init: Firebase.initializeApp,
    builder: () async {
      // ? initialize production dependencies
      final userRepository = UserRepository();
      await userRepository.getOpeningUser();
      return App(userRepository: userRepository);
    },
  );
}
