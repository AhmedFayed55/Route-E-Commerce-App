import 'package:ecommerce_app/features/main_layout/categories/domain/entities/Sub_categories_entity.dart';

import '../../../../../core/errors/failures.dart';
import '../../../home/domain/entities/category_or_brand_response.dart';

abstract class CategoriesTabState {}

class CategoriesTabInitialState extends CategoriesTabState {}

class CategoriesTabLoadingState extends CategoriesTabState {}

class CategoriesTabSuccessState extends CategoriesTabState {
  CategoryOrBrandResponse responseEntity;

  CategoriesTabSuccessState(this.responseEntity);
}

class CategoriesTabErrorState extends CategoriesTabState {
  Failures failures;

  CategoriesTabErrorState(this.failures);
}

class SelectNewCategoryState extends CategoriesTabState {}

class SubCategoriesLoadingState extends CategoriesTabState {}

class SubCategoriesSuccessState extends CategoriesTabState {
  SubCategoriesEntity subCategoriesEntity;

  SubCategoriesSuccessState(this.subCategoriesEntity);
}

class SubCategoriesErrorState extends CategoriesTabState {
  Failures error;

  SubCategoriesErrorState(this.error);
}
