import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/category_or_brand_response.dart';

abstract class HomeTabRepository {
  Future<Either<Failures, CategoryOrBrandResponse>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponse>> getAllBrands();
}
