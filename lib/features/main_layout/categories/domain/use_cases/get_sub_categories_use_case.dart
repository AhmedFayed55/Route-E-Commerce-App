import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/Sub_categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/categories_tab_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';

@injectable
class GetSubCategoriesUseCase {
  CategoriesTabRepo repo;

  GetSubCategoriesUseCase(this.repo);

  Future<Either<Failures, SubCategoriesEntity>> invoke(String id) =>
      repo.getSubCategories(id);
}
