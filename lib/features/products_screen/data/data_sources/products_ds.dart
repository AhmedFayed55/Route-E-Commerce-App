import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/Product_response_entity.dart';

abstract class ProductsDataSource {
  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
