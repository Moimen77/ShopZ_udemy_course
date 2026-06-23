import 'package:shop_z/src/features/HomePage/cubit/CategoriesStates.dart';
import 'package:shop_z/src/features/HomePage/repo/HomePageRepo.dart';
import 'package:shop_z/src/imports/imports.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit(this.repo) : super(CategoriesStates());
  final HomePageRepo repo;
  Future<void> getcategories() async {
    final res = await repo.getcategories();
    res.fold((fail) {
      emit(state.copywith(AppStatus.failure, fail, null));
    }, (res) {
      emit(state.copywith(AppStatus.success, null, res));
    });
  }
}
