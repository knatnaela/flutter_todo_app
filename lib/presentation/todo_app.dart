import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/di/get_it.dart';
import 'package:flutter_todo_app/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/loading/loading_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/register/register_bloc.dart';
import 'package:flutter_todo_app/presentation/views/home_screen.dart';
import 'package:flutter_todo_app/presentation/views/loading_screen.dart';
import 'package:flutter_todo_app/presentation/views/login_screen.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  late LoginBloc loginBloc;
  late RegisterBloc registerBloc;
  late LoadingBloc loadingBloc;
  late AuthenticationBloc authenticationBloc;
  @override
  void initState() {
    super.initState();
    authenticationBloc = getItInstance<AuthenticationBloc>();
    authenticationBloc.add(AppStarted());
    loginBloc = getItInstance<LoginBloc>();
    registerBloc = getItInstance<RegisterBloc>();
    loadingBloc = getItInstance<LoadingBloc>();
  }

  @override
  void dispose() {
    authenticationBloc.close();
    loginBloc.close();
    registerBloc.close();
    loadingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>.value(value: authenticationBloc),
        BlocProvider<LoginBloc>.value(value: loginBloc),
        BlocProvider<RegisterBloc>.value(value: registerBloc),
        BlocProvider<LoadingBloc>.value(value: loadingBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todo App",
        theme: ThemeData(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child) {
          return LoadingScreen(screen: child!);
        },
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationUninitialized) {
              return const LoadingScreen(screen: SizedBox());
            }
            if (state is AuthenticationAuthenticated) {
              return const HomeScreen();
            }
            if (state is AuthenticationUnauthenticated) {
              return const LoadingScreen(
                screen: LoginScreen(),
              );
            }
            return const LoadingScreen(
              screen: SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
