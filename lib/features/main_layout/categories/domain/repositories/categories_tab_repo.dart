import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/Sub_categories_entity.dart';

import '../../../../../core/errors/failures.dart';

abstract class CategoriesTabRepo {
  Future<Either<Failures, SubCategoriesEntity>> getSubCategories(String id);
}
