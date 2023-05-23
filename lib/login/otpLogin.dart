import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formula_quiz/services/services.dart';

class OtpLoginScreen extends StatelessWidget {
  const OtpLoginScreen({super.key});
  
  get onSendMagicLink => null;
  
  get emailController => null;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                    TextFormField(
          controller: emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return 'Please enter an email';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {AuthService().signInOtp(emailController.text);},
          child: const Text('Sign in'),
        ),
        const SizedBox(
          height: 16,
        ),
          ],
        ),
      ),
    );
  }
  
 
}