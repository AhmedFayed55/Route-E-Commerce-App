import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/cart/domain/entities/get_cart_items_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartItemsUseCase {
  GetCartItemsUseCase(this._repository);

  final CartRepository _repository;

  Future<Either<Failures, GetCartItemsEntity>> invoke() =>
      _repository.getCartItems();
}
