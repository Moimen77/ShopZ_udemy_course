// ignore_for_file: non_constant_identifier_names

class AppEndPoint {
  static const String BaseUrl = 'https://fakestoreapi.com';
  static String Login = '${AppEndPoint.BaseUrl}/auth/login';
  static String getProducts = '${AppEndPoint.BaseUrl}/products';
  static String getCategories = '${AppEndPoint.getProducts}/categories';
  static String getProductCategory = '${AppEndPoint.getProducts}/category/';
}
