import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/register_use_case.dart';
import 'auth_states.dart';

@injectable
class AuthCubit extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;

  AuthCubit({required this.registerUseCase, required this.loginUseCase})
    : super(AuthInitialState());

  var formKey = GlobalKey<FormState>();

  void register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.execute(
        name,
        email,
        password,
        rePassword,
        phone,
      );
      either.fold(
        (error) {
          emit(RegisterErrorState(error: error));
        },
        (response) {
          emit(RegisterSuccessState(responseEntity: response));
        },
      );
    }
  }

  void login(String email, String password) async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(email, password);
      either.fold(
        (error) {
          emit(LoginErrorState(error: error));
        },
        (response) {
          emit(LoginSuccessState(response: response));
        },
      );
    }
  }
}
