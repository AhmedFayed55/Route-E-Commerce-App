import 'package:ecommerce_app/features/products_screen/domain/entities/Product_response_entity.dart';

class GetAllWishlistEntity {
  GetAllWishlistEntity({this.status, this.statusMsg, this.count, this.data});

  String? status;
  String? statusMsg;
  num? count;
  List<ProductEntity>? data;
}
