class Apis {
  const Apis._();

  ///AUTH API
  static const String auth = "auth/";

  ///TASK API
  static const tasks = "tasks/";

  ///USER API
  static const user = "users/";

  ///LOGIN ENDPOINT
  static const String login = "${auth}login";

  ///REGISTER ENDPOINT
  static const String register = user;

  ///GET ALL TASKS
  static const String getAllTasks = tasks;

  ///CREATE TASK
  static const String createTask = tasks;
}
