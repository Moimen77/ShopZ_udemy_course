import 'package:shop_z/src/features/HomePage/models/productModel.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class Homepagestates {
  Homepagestates(
      {this.status = AppStatus.initial, this.faliure, this.productRes});
  final AppStatus status;
  final Failure? faliure;
  final List<products>? productRes;

  Homepagestates copyWith(
      AppStatus status, Failure? faliure, List<products>? productRes) {
    return Homepagestates(
        status: status, faliure: faliure, productRes: productRes);
  }
}
