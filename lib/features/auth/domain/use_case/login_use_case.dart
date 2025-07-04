import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/login_response_entity.dart';
import '../repos/repositories/auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(
    String email,
    String password,
  ) {
    return authRepository.login(email, password);
  }
}
