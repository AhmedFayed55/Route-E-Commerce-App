import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_sources/wishlist_ds.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/get_all_wishlist_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/endpoints.dart';
import '../../../../../core/local_ds/prefs_helper.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/strings.dart';

@Injectable(as: WishlistDataSource)
class WishlistDataSourceImpl implements WishlistDataSource {
  WishlistDataSourceImpl(this._apiManager);

  final ApiManager _apiManager;

  @override
  Future<Either<Failures, GetAllWishlistDto>> getAllWishlist() async {
    try {
      final List<ConnectivityResult> connectivityResult = await Connectivity()
          .checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await _apiManager.getData(
          endPoint: EndPoints.getAllWishlist,
          headers: {
            AppConstants.token: PrefHelper.getData(key: AppConstants.token),
          },
        );
        var getAllWishlistResponse = GetAllWishlistDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllWishlistResponse);
        } else {
          return Left(
            ServerError(errorMessage: getAllWishlistResponse.statusMsg!),
          );
        }
      } else {
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
