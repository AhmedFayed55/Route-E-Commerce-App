import 'package:ecommerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';

import 'data.dart';

class AddToCartDto {
  AddToCartDto({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  AddToCartDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataDto.fromJson(json['data']) : null;
  }

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  DataDto? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  AddToCartEntity toEntity() => AddToCartEntity(
    data: data?.toEntity(),
    message: message,
    cartId: cartId,
    numOfCartItems: numOfCartItems,
    status: status,
  );
}
