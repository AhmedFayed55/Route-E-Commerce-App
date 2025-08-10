import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/local_ds/prefs_helper.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/strings.dart';
import 'package:ecommerce_app/features/product_details/data/data_sources/add_to_cart_ds.dart';
import 'package:ecommerce_app/features/product_details/data/models/add_to_cart_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartDataSource)
class AddToCartDataSourceImpl implements AddToCartDataSource {
  AddToCartDataSourceImpl(this._apiManager);

  final ApiManager _apiManager;

  @override
  Future<Either<Failures, AddToCartDto>> addToCart(String id) async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await _apiManager.postData(
          endPoint: EndPoints.addToCart,
          body: {"productId": id},
          headers: {
            AppConstants.token: PrefHelper.getData(key: AppConstants.token),
          },
        );
        var addToCartResponse = AddToCartDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToCartResponse);
        } else {
          return Left(ServerError(errorMessage: addToCartResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
