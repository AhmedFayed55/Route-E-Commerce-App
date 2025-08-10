import '../../../../products_screen/domain/entities/Product_response_entity.dart';

class WishlistState {
  bool isLoadingGetAllWishlist = false;

  String? errorGetAllWishlist;

  String? successGetAllWishlist;

  List<ProductEntity> products;

  WishlistState({
    this.isLoadingGetAllWishlist = false,
    this.errorGetAllWishlist,
    this.successGetAllWishlist,
    this.products = const [],
  });

  WishlistState copyWith({
    bool? isLoadingGetAllWishlist,
    String? errorGetAllWishlist,
    String? successGetAllWishlist,
    List<ProductEntity>? products,
  }) {
    return WishlistState(
      isLoadingGetAllWishlist:
          isLoadingGetAllWishlist ?? this.isLoadingGetAllWishlist,
      errorGetAllWishlist: errorGetAllWishlist ?? this.errorGetAllWishlist,
      successGetAllWishlist:
          successGetAllWishlist ?? this.successGetAllWishlist,
      products: products ?? this.products,
    );
  }
}
