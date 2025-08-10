import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/product_details/data/data_sources/add_to_cart_ds.dart';
import 'package:ecommerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';
import 'package:ecommerce_app/features/product_details/domain/repositories/add_to_cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRepository)
class AddToCartRepositoryImpl implements AddToCartRepository {
  AddToCartRepositoryImpl(this._dataSource);

  final AddToCartDataSource _dataSource;

  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String id) async {
    var either = await _dataSource.addToCart(id);

    return either.fold(
      (error) => Left(error),
      (response) => Right(response.toEntity()),
    );
  }
}
