class EndPoints {
  static const String register = "/api/v1/auth/signup";
  static const String login = "/api/v1/auth/signin";
  static const String getAllCategories = "/api/v1/categories";
  static const String getAllBrands = "/api/v1/brands";
  static const String getAllProducts = "/api/v1/products";
  static const String getUserCart = "/api/v1/cart";
  static const String addToCart = "/api/v1/cart";
  static const String clearAllCart = "/api/v1/cart";
  static const String addToWishlist = "/api/v1/wishlist";
  static const String getAllWishlist = "/api/v1/wishlist";

  static String getAllSubCategoriesByCategoryId(String id) =>
      "/api/v1/categories/$id/subcategories";

  static String updateCartProductEntity(String id) => "/api/v1/cart/$id";

  static String removeSpecificCartItem(String id) => "/api/v1/cart/$id";

  static String deleteFromWishlist(String id) => "/api/v1/wishlist/$id";
}
