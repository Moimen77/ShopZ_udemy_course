import 'package:shop_z/src/config/AppEndPoint.dart';
import 'package:shop_z/src/features/HomePage/models/productModel.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class Homepagereomte {
  Homepagereomte(this.dio);
  final DioService dio;

  Future<List<products>> getProduct() async {
    final res = await dio.get(AppEndPoint.getProducts);
    return res.fold(
      (failure) => throw const ServerFailure('something went Wrong'),
      (productRes) {
        final List<dynamic> data = productRes.data as List<dynamic>;

        return data
            .map(
              (item) => products.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
      },
    );
  }

  Future<List<String>> getcategories() async {
    final res = await dio.get(AppEndPoint.getCategories);
    return res.fold(
      (failure) => throw const ServerFailure('something went Wrong'),
      (cats) {
        final data = cats.data;
        return List<String>.from(data);
      },
    );
  }
}
