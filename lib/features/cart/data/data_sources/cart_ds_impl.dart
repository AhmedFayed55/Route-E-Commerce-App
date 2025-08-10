import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/cart_ds.dart';
import 'package:ecommerce_app/features/cart/data/models/get_cart_items_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/local_ds/prefs_helper.dart';
import '../../../../core/resources/constants_manager.dart';
import '../../../../core/resources/strings.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImpl implements CartDataSource {
  CartDataSourceImpl(this._apiManager);

  final ApiManager _apiManager;

  @override
  Future<Either<Failures, GetCartItemsDto>> getCartItems() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await _apiManager.getData(
          endPoint: "/api/v1/cart",
          headers: {
            AppConstants.token: PrefHelper.getData(key: AppConstants.token),
          },
        );
        var getCartItemsResponse = GetCartItemsDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartItemsResponse);
        } else {
          return Left(ServerError(errorMessage: getCartItemsResponse.status!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
