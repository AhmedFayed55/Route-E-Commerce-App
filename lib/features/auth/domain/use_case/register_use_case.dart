import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/register_response_entity.dart';
import '../repos/repositories/auth_repository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> execute(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
