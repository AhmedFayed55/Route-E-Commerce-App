import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entity/login_response_entity.dart';
import 'package:ecommerce_app/features/auth/domain/entity/register_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
    String email,
    String password,
  ) async {
    var either = await dataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var either = await dataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
