import '../../../../core/errors/failures.dart';
import '../../domain/entity/login_response_entity.dart';
import '../../domain/entity/register_response_entity.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  RegisterResponseEntity responseEntity;

  RegisterSuccessState({required this.responseEntity});
}

class RegisterErrorState extends AuthStates {
  Failures error;

  RegisterErrorState({required this.error});
}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  LoginResponseEntity response;

  LoginSuccessState({required this.response});
}

class LoginErrorState extends AuthStates {
  Failures error;

  LoginErrorState({required this.error});
}
