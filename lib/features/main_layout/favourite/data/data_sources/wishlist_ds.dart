import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/get_all_wishlist_dto.dart';

abstract interface class WishlistDataSource {
  Future<Either<Failures, GetAllWishlistDto>> getAllWishlist();
}
