import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/Product_response_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
