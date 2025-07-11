import 'package:ecommerce_app/features/main_layout/categories/domain/entities/Sub_categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/meta_data_dto.dart';

import 'sub_category_model.dart';

class SubCategoriesResponse {
  SubCategoriesResponse({this.results, this.metadata, this.data});

  SubCategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SubCategoryModel.fromJson(v));
      });
    }
  }

  num? results;
  MetadataDto? metadata;
  List<SubCategoryModel>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  SubCategoriesEntity toSubCategoriesEntity() {
    return SubCategoriesEntity(
      data: data?.map((model) => model.toSubCategoryEntity()).toList(),
    );
  }
}
