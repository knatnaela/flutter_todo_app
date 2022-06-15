import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/domain/entities/no_params.dart';
import 'package:flutter_todo_app/domain/usecases/login_user.dart';
import 'package:flutter_todo_app/presentation/bloc/loading/loading_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/auth_model/auth_request.dart';
import '../../../domain/usecases/logout_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  final LoadingBloc loadingBloc;
  final LogOutUser logOutUser;
  LoginBloc({
    required this.logOutUser,
    required this.loginUser,
    required this.loadingBloc,
  }) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginInitiateEvent) {
        loadingBloc.add(StartLoading());
        final response = await loginUser(
          AuthRequest(
            email: event.email,
            password: event.password,
          ),
        );
        emit(response.fold(
            (l) => LoginError(message: l.message), (r) => LoginSuccess()));
        loadingBloc.add(FinishLoading());
      } else if (event is LogOutEvent) {
        await logOutUser(NoParams());
        emit(LogOutSuccess());
      }
    });
  }
}
