import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/views/registration_form.dart';

import 'login_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 32),
            ),
          ),
          RegistrationForm()
        ],
      ),
    );
  }
}
