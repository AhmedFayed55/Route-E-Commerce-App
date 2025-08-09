import 'package:ecommerce_app/features/products_screen/domain/entities/delete_or_add_to_wishlist_entity.dart';

class DeleteOrAddToWishlistDto extends DeleteOrAddToWishlistEntity {
  DeleteOrAddToWishlistDto({
    super.status,
    super.statusMsg,
    super.message,
    super.data,
  });

  DeleteOrAddToWishlistDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
