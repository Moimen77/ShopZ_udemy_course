import 'package:shop_z/src/imports/core_imports.dart';

class CategoriesStates {
  final AppStatus status;
  final Failure? fail;
  final List<String>? categories;
  CategoriesStates(
      {this.status = AppStatus.initial, this.fail, this.categories});
  CategoriesStates copywith(
      AppStatus status, Failure? fail, List<String>? categories) {
    return CategoriesStates(status: status, fail: fail, categories: categories);
  }
}
