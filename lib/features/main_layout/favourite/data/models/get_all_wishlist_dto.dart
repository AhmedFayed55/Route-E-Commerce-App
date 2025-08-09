import 'package:ecommerce_app/features/main_layout/favourite/domain/entities/get_all_wishlist_entity.dart';

import '../../../../products_screen/data/models/product_response_dto.dart';

class GetAllWishlistDto extends GetAllWishlistEntity {
  GetAllWishlistDto({super.status, super.statusMsg, super.count, super.data});

  GetAllWishlistDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }
}
