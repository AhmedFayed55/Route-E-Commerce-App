import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../entity/login_response_entity.dart';
import '../../entity/register_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );

  Future<Either<Failures, LoginResponseEntity>> login(
    String email,
    String password,
  );
}
