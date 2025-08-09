import 'package:ecommerce_app/features/products_screen/domain/entities/delete_or_add_to_wishlist_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/Product_response_entity.dart';

abstract class ProductTabStates {}

class ProductTabInitialState extends ProductTabStates {}

class ProductTabLoadingState extends ProductTabStates {}

class ProductTabErrorState extends ProductTabStates {
  Failures failures;

  ProductTabErrorState({required this.failures});
}

class ProductTabSuccessState extends ProductTabStates {
  ProductResponseEntity responseEntity;

  ProductTabSuccessState({required this.responseEntity});
}

class AddToWishListSuccessState extends ProductTabStates {
  DeleteOrAddToWishlistEntity response;

  AddToWishListSuccessState({required this.response});
}

class AddToWishListErrorState extends ProductTabStates {
  String failures;

  AddToWishListErrorState({required this.failures});
}

class WishListLoadingState extends ProductTabStates {}
