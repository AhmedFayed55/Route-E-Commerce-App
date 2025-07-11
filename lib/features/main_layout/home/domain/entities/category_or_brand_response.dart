import 'meta_data.dart';

class CategoryOrBrandResponse {
  CategoryOrBrandResponse({this.results, this.metadata, this.data});

  int? results;
  Metadata? metadata;
  List<CategoryOrBrand>? data;
}

class CategoryOrBrand {
  CategoryOrBrand({this.id, this.name, this.slug, this.image});

  String? id;
  String? name;
  String? slug;
  String? image;
}

