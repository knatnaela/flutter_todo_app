import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
          LoginForm()
        ],
      ),
    );
  }
}
