import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/product_details/data/models/add_to_cart_dto.dart';

abstract interface class AddToCartDataSource {
  Future<Either<Failures, AddToCartDto>> addToCart(String id);
}
