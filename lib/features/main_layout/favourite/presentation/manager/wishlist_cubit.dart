import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/use_cases/get_all_wishlist_use_case.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/manager/wishlist_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.useCase) : super(WishlistState());

  final GetAllWishlistUseCase useCase;

  getAllWishlist() async {
    emit(state.copyWith(isLoadingGetAllWishlist: true));
    var either = await useCase.invoke();

    either.fold(
      (error) => emit(
        state.copyWith(
          isLoadingGetAllWishlist: false,
          errorGetAllWishlist: error.errorMessage,
        ),
      ),
      (response) => emit(
        state.copyWith(
          isLoadingGetAllWishlist: false,
          successGetAllWishlist: response.statusMsg,
          products: response.data,
        ),
      ),
    );
  }
}
