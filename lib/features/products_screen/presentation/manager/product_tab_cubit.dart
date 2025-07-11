import 'package:ecommerce_app/features/products_screen/presentation/manager/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/get_products_use_case.dart';

@injectable
class ProductTabCubit extends Cubit<ProductTabStates> {
  GetProductsUseCase getAllProductsUseCase;

  ProductTabCubit({required this.getAllProductsUseCase})
    : super(ProductTabInitialState());

  static ProductTabCubit get(context) =>
      BlocProvider.of<ProductTabCubit>(context);

  void getProducts() async {
    emit(ProductTabLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold(
      (error) {
        emit(ProductTabErrorState(failures: error));
      },
      (response) {
        emit(ProductTabSuccessState(responseEntity: response));
      },
    );
  }
}
