import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/cart/data/models/get_cart_items_dto.dart';

abstract interface class CartDataSource {
  Future<Either<Failures, GetCartItemsDto>> getCartItems();
}
