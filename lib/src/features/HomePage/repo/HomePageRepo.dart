import 'package:shop_z/src/features/HomePage/models/productModel.dart';
import 'package:shop_z/src/features/HomePage/remote/HomePageReomte.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class HomePageRepo {
  final Homepagereomte remote;

  HomePageRepo(
    this.remote,
  );

  FutureEither<List<products>> getProudcts() {
    return runTask(
      () => remote.getProduct(),
      requiresNetwork: true,
    );
  }
}
