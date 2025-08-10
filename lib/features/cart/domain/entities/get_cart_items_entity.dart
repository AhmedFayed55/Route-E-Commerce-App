class GetCartItemsEntity {
  GetCartItemsEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  num? numOfCartItems;
  String? cartId;
  CartDataEntity? data;
}

class CartDataEntity {
  CartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<CartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class CartProductsEntity {
  CartProductsEntity({this.count, this.id, this.product, this.price});

  num? count;
  String? id;
  CartProductEntity? product;
  num? price;
}

class CartProductEntity {
  CartProductEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<CartSubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CartCategoryEntity? category;
  CartBrandEntity? brand;
  num? ratingsAverage;
}

class CartBrandEntity {
  CartBrandEntity({this.id, this.name, this.slug, this.image});

  String? id;
  String? name;
  String? slug;
  String? image;
}

class CartCategoryEntity {
  CartCategoryEntity({this.id, this.name, this.slug, this.image});

  String? id;
  String? name;
  String? slug;
  String? image;
}

class CartSubcategoryEntity {
  CartSubcategoryEntity({this.id, this.name, this.slug, this.category});

  String? id;
  String? name;
  String? slug;
  String? category;
}
