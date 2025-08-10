class AddToCartState {
  bool isLoadingAddToCart = false;

  String? errorAddToCart;

  String? successAddToCart;

  AddToCartState({
    this.isLoadingAddToCart = false,
    this.errorAddToCart,
    this.successAddToCart,
  });

  AddToCartState copyWith({
    bool? isLoadingAddToCart,
    String? errorAddToCart,
    String? successAddToCart,
  }) {
    return AddToCartState(
      isLoadingAddToCart: isLoadingAddToCart ?? this.isLoadingAddToCart,
      errorAddToCart: errorAddToCart ?? this.errorAddToCart,
      successAddToCart: successAddToCart ?? this.successAddToCart,
    );
  }
}
