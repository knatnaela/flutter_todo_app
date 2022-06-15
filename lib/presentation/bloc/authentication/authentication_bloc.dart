import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/data_source/authentication_local_data_source.dart';
import 'package:flutter_todo_app/presentation/bloc/loading/loading_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoadingBloc loadingBloc;
  final AuthenticationLocalDataSource localDataSource;
  AuthenticationBloc({required this.loadingBloc, required this.localDataSource})
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AppStarted) {
        loadingBloc.add(StartLoading());
        final String? token = await localDataSource.getToken();
        if (token != null) {
          emit(AuthenticationAuthenticated());
        } else {
          emit(AuthenticationUnauthenticated());
        }
        loadingBloc.add(FinishLoading());
      }
    });
  }
}
