import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';

import '../../../../core/errors/failures.dart';

abstract interface class AddToCartRepository {
  Future<Either<Failures, AddToCartEntity>> addToCart(String id);
}
