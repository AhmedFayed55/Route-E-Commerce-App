import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/products_ds.dart';
import 'package:ecommerce_app/features/products_screen/data/models/product_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/errors/failures.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource {
  ApiManager apiManager;

  ProductsDataSourceImpl(this.apiManager);

  @override
  Future<Either<Failures, ProductResponseDto>> getProducts(categoryId) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllProducts,
            queryParameters: {
              "category[in]": categoryId
            }
        );
        var productResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
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
