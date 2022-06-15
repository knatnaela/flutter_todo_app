import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/core/extensions/validators.dart';
import 'package:flutter_todo_app/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_todo_app/presentation/views/home_screen.dart';
import 'package:flutter_todo_app/presentation/views/register_screen.dart';
import 'package:flutter_todo_app/presentation/widget/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Form(
          child: Column(
            children: [
              CustomTextField(
                labelText: "email",
                controller: emailController,
                validator: (value) =>
                    value.toString().validateField(fieldName: "email"),
              ),
              CustomTextField(
                labelText: "password",
                controller: passwordController,
                obscureText: true,
                validator: (value) =>
                    value.toString().validateField(fieldName: "password"),
              ),
              BlocConsumer<LoginBloc, LoginState>(
                buildWhen: (previous, current) => current is LoginError,
                builder: (context, state) {
                  if (state is LoginError) {
                    return Text(state.message);
                  }
                  return const SizedBox.shrink();
                },
                listenWhen: (previous, current) => current is LoginSuccess,
                listener: (context, state) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginInitiateEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                },
                child: const Text("Login"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ));
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
