import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_or_brand_response.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/get_sub_categories_use_case.dart';
import 'categories_tab_state.dart';

@injectable
class CategoriesTabCubit extends Cubit<CategoriesTabState> {
  CategoriesTabCubit({
    required this.allCategoriesUseCase,
    required this.subCategoriesUseCase,
  }) : super(CategoriesTabInitialState());

  GetAllCategoriesUseCase allCategoriesUseCase;

  CategoryOrBrand? selectedCategory;

  static CategoriesTabCubit get(context) => BlocProvider.of(context);

  getCategories() async {
    emit(CategoriesTabLoadingState());
    var either = await allCategoriesUseCase.invoke();
    either.fold(
      (error) {
        emit(CategoriesTabErrorState(error));
      },
      (response) {
        selectedCategory = response.data![0];
        getSubCategories();
        emit(CategoriesTabSuccessState(response));
      },
    );
  }

  selectCategory(CategoryOrBrand newCategory) {
    selectedCategory = newCategory;
    getSubCategories();
    emit(SelectNewCategoryState());
  }

  GetSubCategoriesUseCase subCategoriesUseCase;

  getSubCategories() async {
    emit(SubCategoriesLoadingState());
    var either = await subCategoriesUseCase.invoke(selectedCategory?.id ?? "");

    either.fold(
      (error) {
        emit(SubCategoriesErrorState(error));
      },
      (response) {
        emit(SubCategoriesSuccessState(response));
      },
    );
  }
}
