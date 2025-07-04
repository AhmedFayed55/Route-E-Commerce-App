import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/entity/login_response_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/resources/strings.dart';
import '../model/login_response_dto.dart';
import '../model/register_response_dto.dart';

class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;

  AuthDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.register,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": rePassword,
            "phone": phone,
          },
        );
        // todo : response is json so i have to convert
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        // todo : no internet connection
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.login,
          body: {"email": email, "password": password},
        );
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
