import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_z/src/features/HomePage/cubit/HomepageStates.dart';
import 'package:shop_z/src/features/HomePage/repo/homepagerepo.dart';

import 'package:shop_z/src/imports/core_imports.dart';

class Homepagecubit extends Cubit<Homepagestates> {
  Homepagecubit(this.repo) : super(Homepagestates());

  final HomePageRepo repo;

  Future<void> getproduct() async {
    emit(
      state.copyWith(AppStatus.loading, null, null),
    );

    final res = await repo.getProudcts();

    res.fold(
      (fail) {
        emit(
          state.copyWith(AppStatus.failure, fail, null),
        );
      },
      (productsRes) {
        emit(
          state.copyWith(
            AppStatus.success,
            null,
            productsRes,
          ),
        );
      },
    );
  }

  Future<void> getProductByCat(String cat) async {
    emit(
      state.copyWith(AppStatus.loading, null, null),
    );

    final res = await repo.getProductBycategories(cat);

    res.fold(
      (fail) {
        emit(
          state.copyWith(AppStatus.failure, fail, null),
        );
      },
      (productsRes) {
        emit(
          state.copyWith(
            AppStatus.success,
            null,
            productsRes,
          ),
        );
      },
    );
  }
}
