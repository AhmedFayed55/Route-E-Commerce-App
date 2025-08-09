import 'package:ecommerce_app/features/products_screen/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manager/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/get_products_use_case.dart';

@injectable
class ProductTabCubit extends Cubit<ProductTabStates> {
  GetProductsUseCase getAllProductsUseCase;
  AddToWishlistUseCase addToWishlistUseCase;

  ProductTabCubit(
      {required this.getAllProductsUseCase, required this.addToWishlistUseCase})
    : super(ProductTabInitialState());

  static ProductTabCubit get(context) =>
      BlocProvider.of<ProductTabCubit>(context);

  void getProducts(categoryId) async {
    emit(ProductTabLoadingState());
    var either = await getAllProductsUseCase.invoke(categoryId);
    either.fold(
      (error) {
        emit(ProductTabErrorState(failures: error));
      },
      (response) {
        emit(ProductTabSuccessState(responseEntity: response));
      },
    );
  }

  void addToWishlist(String id) async {
    var either = await addToWishlistUseCase.invoke(id);
  }

}
