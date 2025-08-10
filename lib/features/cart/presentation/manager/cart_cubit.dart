import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart_items_use_case.dart';
import 'package:injectable/injectable.dart';

import 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this.useCase) : super(CartState());

  GetCartItemsUseCase useCase;

  getCartItems() async {
    emit(state.copyWith(isLoadingGetCartItems: true));
    var either = await useCase.invoke();
    either.fold(
      (error) => emit(
        state.copyWith(
          isLoadingGetCartItems: false,
          errorGetCartItems: error.errorMessage,
        ),
      ),
      (response) => emit(
        state.copyWith(
          isLoadingGetCartItems: false,
          successGetCartItems: response.status,
          products: response.data?.products ?? [],
        ),
      ),
    );
  }
}
