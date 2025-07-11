import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/Sub_categories_response.dart';
import 'package:injectable/injectable.dart';

import 'categories_tab_ds.dart';

@Injectable(as: CategoriesTabDataSource)
class CategoriesTabDataSourceImpl implements CategoriesTabDataSource {
  ApiManager apiManager;

  CategoriesTabDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, SubCategoriesResponse>> getSubCategories(
    String id,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var jsonResponse = await apiManager.getData(
          endPoint: EndPoints.getAllSubCategoriesByCategoryId(id),
        );
        var response = SubCategoriesResponse.fromJson(jsonResponse.data);
        if (jsonResponse.statusCode! >= 200 && jsonResponse.statusCode! < 300) {
          return Right(response);
        } else {
          return Left(ServerError(errorMessage: "Error"));
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
