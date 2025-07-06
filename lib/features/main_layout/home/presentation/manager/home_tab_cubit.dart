import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category_or_brand_response.dart';
import '../../domain/use_cases/get_all_brands_use_case.dart';
import '../../domain/use_cases/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandesUseCase,
  }) : super(HomeTabInitialState());
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandesUseCase getAllBrandesUseCase;

  List<CategoryOrBrand> categoriesList = [];
  List<CategoryOrBrand> brandsList = [];

  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (error) {
        emit(CategoryErrorState(failures: error));
      },
      (response) {
        categoriesList = response.data!;
        emit(CategorySuccessState(responseEntity: response));
      },
    );
  }

  void getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandesUseCase.invoke();
    either.fold(
      (error) {
        emit(BrandErrorState(failures: error));
      },
      (response) {
        brandsList = response.data!;
        emit(BrandSuccessState(responseEntity: response));
      },
    );
  }
}
