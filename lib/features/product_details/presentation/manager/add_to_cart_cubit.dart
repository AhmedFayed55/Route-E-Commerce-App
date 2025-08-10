import 'package:ecommerce_app/features/product_details/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/product_details/presentation/manager/add_to_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartUseCase useCase;

  AddToCartCubit(this.useCase) : super(AddToCartState());

  addToCart(String id) async {
    emit(state.copyWith(isLoadingAddToCart: true));
    var either = await useCase.invoke(id);
    either.fold(
      (error) => emit(
        state.copyWith(
          isLoadingAddToCart: false,
          errorAddToCart: error.errorMessage,
        ),
      ),
      (response) => emit(
        state.copyWith(
          isLoadingAddToCart: false,
          successAddToCart: response.message,
        ),
      ),
    );
  }
}
