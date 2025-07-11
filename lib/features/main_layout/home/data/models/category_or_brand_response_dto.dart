import '../../domain/entities/category_or_brand_response.dart';
import 'meta_data_dto.dart';

class CategoryOrBrandResponseDto extends CategoryOrBrandResponse {
  CategoryOrBrandResponseDto({super.results, super.metadata, super.data});

  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDto.fromJson(v));
      });
    }
  }

  String? message;
  String? statusMsg;
}

class CategoryOrBrandDto extends CategoryOrBrand {
  CategoryOrBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryOrBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}


