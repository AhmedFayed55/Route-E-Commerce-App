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

class Metadata {
  Metadata({this.currentPage, this.numberOfPages, this.limit});

  int? currentPage;
  int? numberOfPages;
  int? limit;
}
