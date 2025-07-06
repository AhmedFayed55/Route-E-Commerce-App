import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../core/api/api_manager.dart';
import '../../../../../../core/api/endpoints.dart';
import '../../../../../../core/errors/failures.dart';
import '../../models/category_or_brand_response_dto.dart';
import '../remote_ds/home_tab_remote_ds.dart';

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  ApiManager apiManager;

  HomeTabRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>>
  getAllCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllCategories,
        );
        var categoryResponse = CategoryOrBrandResponseDto.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(
          NetworkError(
            errorMessage:
                'No Internet Connection, Please check internet connection.',
          ),
        );
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllBrands,
        );
        var brandResponse = CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorMessage: brandResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(
          NetworkError(
            errorMessage:
                'No Internet Connection, Please check internet connection.',
          ),
        );
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
