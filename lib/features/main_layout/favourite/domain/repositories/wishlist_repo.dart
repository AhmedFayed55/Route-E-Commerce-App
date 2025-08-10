import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/entities/get_all_wishlist_entity.dart';

abstract interface class WishlistRepository {
  Future<Either<Failures, GetAllWishlistEntity>> getAllWishlist();
}
