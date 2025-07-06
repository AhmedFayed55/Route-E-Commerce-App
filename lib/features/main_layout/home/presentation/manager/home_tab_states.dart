import '../../../../../core/errors/failures.dart';
import '../../domain/entities/category_or_brand_response.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategoryErrorState extends HomeTabStates {
  Failures failures;

  CategoryErrorState({required this.failures});
}

class CategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponse responseEntity;

  CategorySuccessState({required this.responseEntity});
}

class BrandLoadingState extends HomeTabStates {}

class BrandErrorState extends HomeTabStates {
  Failures failures;

  BrandErrorState({required this.failures});
}

class BrandSuccessState extends HomeTabStates {
  CategoryOrBrandResponse responseEntity;

  BrandSuccessState({required this.responseEntity});
}
