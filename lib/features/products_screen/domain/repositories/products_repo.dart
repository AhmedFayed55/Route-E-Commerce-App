import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/Product_response_entity.dart';
import '../entities/delete_or_add_to_wishlist_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, ProductResponseEntity>> getProducts(categoryId);

  Future<Either<Failures, DeleteOrAddToWishlistEntity>> addToWishlist(
      String id);
}
