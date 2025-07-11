import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/categories_tab_ds.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/entities/Sub_categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/categories_tab_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesTabRepo)
class CategoriesTabRepoImpl implements CategoriesTabRepo {
  CategoriesTabDataSource dataSource;

  CategoriesTabRepoImpl(this.dataSource);

  @override
  Future<Either<Failures, SubCategoriesEntity>> getSubCategories(
    String id,
  ) async {
    var either = await dataSource.getSubCategories(id);
    return either.fold(
      (error) => Left(error),
      (response) => Right(response.toSubCategoriesEntity()),
    );
  }
}
