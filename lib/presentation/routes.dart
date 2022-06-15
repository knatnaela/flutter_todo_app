import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_app/core/route_constants.dart';
import 'package:flutter_todo_app/presentation/views/add_task_screen.dart';
import 'package:flutter_todo_app/presentation/views/loading_screen.dart';
import 'package:flutter_todo_app/presentation/views/login_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initialRoute: (context) => const LoadingScreen(
              screen: LoginScreen(),
            ),
        RouteList.homeScreen: (context) => const LoadingScreen(
              screen: LoginScreen(),
            ),
        RouteList.addTaskScreen: (context) => const LoadingScreen(
              screen: AddTaskScreen(),
            ),
        RouteList.loginScreen: (context) => const LoadingScreen(
              screen: LoginScreen(),
            ),
        RouteList.registerScreen: (context) => const LoadingScreen(
              screen: LoginScreen(),
            ),
      };
}
