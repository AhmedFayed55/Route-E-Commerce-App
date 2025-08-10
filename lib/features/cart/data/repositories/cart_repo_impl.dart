import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/cart_ds.dart';
import 'package:ecommerce_app/features/cart/domain/entities/get_cart_items_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._dataSource);

  final CartDataSource _dataSource;

  @override
  Future<Either<Failures, GetCartItemsEntity>> getCartItems() async {
    var either = await _dataSource.getCartItems();
    return either.fold(
      (error) => Left(error),
      (response) => Right(response.toEntity()),
    );
  }
}
