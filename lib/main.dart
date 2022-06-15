import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/todo_app.dart';
import 'package:get/get.dart';

import 'di/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  runApp(const TodoApp());
}
