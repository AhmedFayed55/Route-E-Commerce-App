import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';
import 'package:ecommerce_app/features/product_details/domain/repositories/add_to_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  AddToCartUseCase(this._repository);

  final AddToCartRepository _repository;

  Future<Either<Failures, AddToCartEntity>> invoke(String id) {
    return _repository.addToCart(id);
  }
}
