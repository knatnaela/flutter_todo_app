part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInitiateEvent extends LoginEvent {
  final String email;
  final String password;
  LoginInitiateEvent({
    required this.email,
    required this.password,
  });
}

class LogOutEvent extends LoginEvent {}
