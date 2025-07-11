import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/Product_response_entity.dart';

@injectable
class GetProductsUseCase {
  GetProductsUseCase(this.repo);

  ProductsRepo repo;

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return repo.getProducts();
  }
}
