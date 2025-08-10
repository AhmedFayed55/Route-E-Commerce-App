import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/cart/domain/entities/get_cart_items_entity.dart';

abstract interface class CartRepository {
  Future<Either<Failures, GetCartItemsEntity>> getCartItems();
}
