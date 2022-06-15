import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/data/models/user_model/user_request.dart';
import 'package:flutter_todo_app/domain/usecases/register_user.dart';
import 'package:flutter_todo_app/presentation/bloc/loading/loading_bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final LoadingBloc loadingBloc;
  final RegisterUser registerUser;
  RegisterBloc({
    required this.loadingBloc,
    required this.registerUser,
  }) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterInitiateEvent) {
        loadingBloc.add(StartLoading());
        final response = await registerUser(
          UserRequest(
            name: event.name,
            email: event.email,
            password: event.password,
          ),
        );
        emit(
          response.fold(
            (l) => RegisterError(message: l.message),
            (r) => RegisterSuccess(),
          ),
        );
        loadingBloc.add(FinishLoading());
      }
    });
  }
}
