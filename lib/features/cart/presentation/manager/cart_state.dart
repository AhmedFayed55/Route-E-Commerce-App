import '../../domain/entities/get_cart_items_entity.dart';

class CartState {
  bool isLoadingGetCartItems = false;

  String? errorGetCartItems;

  String? successGetCartItems;

  List<CartProductsEntity> products;

  CartState({
    this.isLoadingGetCartItems = false,
    this.errorGetCartItems,
    this.successGetCartItems,
    this.products = const [],
  });

  CartState copyWith({
    bool? isLoadingGetCartItems,
    String? errorGetCartItems,
    String? successGetCartItems,
    List<CartProductsEntity>? products,
  }) {
    return CartState(
      products: products ?? this.products,
      errorGetCartItems: errorGetCartItems ?? this.errorGetCartItems,
      successGetCartItems: successGetCartItems ?? this.successGetCartItems,
      isLoadingGetCartItems:
          isLoadingGetCartItems ?? this.isLoadingGetCartItems,
    );
  }
}
