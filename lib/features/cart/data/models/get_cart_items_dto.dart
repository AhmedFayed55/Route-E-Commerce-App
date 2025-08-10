import '../../domain/entities/get_cart_items_entity.dart';

class GetCartItemsDto {
  GetCartItemsDto({this.status, this.numOfCartItems, this.cartId, this.data});

  GetCartItemsDto.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? CartDataDto.fromJson(json['data']) : null;
  }

  String? status;
  num? numOfCartItems;
  String? cartId;
  CartDataDto? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  GetCartItemsEntity toEntity() => GetCartItemsEntity(
    status: status,
    numOfCartItems: numOfCartItems,
    cartId: cartId,
    data: data?.toEntity(),
  );
}

class CartDataDto {
  CartDataDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  CartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? id;
  String? cartOwner;
  List<CartProductsDto>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

  CartDataEntity toEntity() => CartDataEntity(
    id: id,
    cartOwner: cartOwner,
    products: products?.map((e) => e.toEntity()).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt,
    v: v,
    totalCartPrice: totalCartPrice,
  );
}

class CartProductsDto {
  CartProductsDto({this.count, this.id, this.product, this.price});

  CartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? CartProductDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }

  num? count;
  String? id;
  CartProductDto? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }

  CartProductsEntity toEntity() => CartProductsEntity(
    count: count,
    id: id,
    product: product?.toEntity(),
    price: price,
  );
}

class CartProductDto {
  CartProductDto({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  CartProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(CartSubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CartCategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? CartBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
  }

  List<CartSubcategoryDto>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CartCategoryDto? category;
  CartBrandDto? brand;
  num? ratingsAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['title'] = title;
    map['quantity'] = quantity;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['id'] = id;
    return map;
  }

  CartProductEntity toEntity() => CartProductEntity(
    subcategory: subcategory?.map((e) => e.toEntity()).toList(),
    id: id,
    title: title,
    quantity: quantity,
    imageCover: imageCover,
    category: category?.toEntity(),
    brand: brand?.toEntity(),
    ratingsAverage: ratingsAverage,
  );
}

class CartBrandDto {
  CartBrandDto({this.id, this.name, this.slug, this.image});

  CartBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  CartBrandEntity toEntity() =>
      CartBrandEntity(id: id, name: name, slug: slug, image: image);
}

class CartCategoryDto {
  CartCategoryDto({this.id, this.name, this.slug, this.image});

  CartCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  CartCategoryEntity toEntity() =>
      CartCategoryEntity(id: id, name: name, slug: slug, image: image);
}

class CartSubcategoryDto {
  CartSubcategoryDto({this.id, this.name, this.slug, this.category});

  CartSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

  CartSubcategoryEntity toEntity() =>
      CartSubcategoryEntity(id: id, name: name, slug: slug, category: category);
}
