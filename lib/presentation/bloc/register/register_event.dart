part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterInitiateEvent extends RegisterEvent {
  final String email;
  final String name;
  final String password;
  RegisterInitiateEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
