import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/Sub_categories_response.dart';

abstract class CategoriesTabDataSource {
  Future<Either<Failures, SubCategoriesResponse>> getSubCategories(String id);
}
