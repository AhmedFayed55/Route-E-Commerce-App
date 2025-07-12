import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/products_ds.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/Product_response_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductRepoImpl implements ProductsRepo {
  ProductsDataSource dataSource;

  ProductRepoImpl(this.dataSource);

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts(
      categoryId) async {
    var either = await dataSource.getProducts(categoryId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
