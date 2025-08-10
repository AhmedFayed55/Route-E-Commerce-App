import 'products.dart';

class DataEntity {
  DataEntity({this.id, this.cartOwner, this.products, this.totalCartPrice});

  String? id;
  String? cartOwner;
  List<ProductsEntity>? products;
  num? totalCartPrice;
}
