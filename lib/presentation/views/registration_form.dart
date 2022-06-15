import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/core/extensions/validators.dart';
import 'package:flutter_todo_app/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/register/register_bloc.dart';
import 'package:flutter_todo_app/presentation/views/home_screen.dart';
import 'package:flutter_todo_app/presentation/views/login_screen.dart';
import 'package:flutter_todo_app/presentation/widget/custom_text_field.dart';

class RegistrationForm extends StatefulWidget {
  RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  late TextEditingController emailController,
      passwordController,
      nameController;
  bool enableLogin = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
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
                labelText: "name",
                controller: nameController,
                validator: (value) =>
                    value.toString().validateField(fieldName: "name"),
              ),
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
              BlocConsumer<RegisterBloc, RegisterState>(
                buildWhen: (previous, current) => current is RegisterError,
                builder: (context, state) {
                  if (state is RegisterError) {
                    return Text(state.message);
                  }
                  return const SizedBox.shrink();
                },
                listenWhen: (previous, current) => current is RegisterSuccess,
                listener: (context, state) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<RegisterBloc>(context).add(
                    RegisterInitiateEvent(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
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
