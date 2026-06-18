import 'package:get_it/get_it.dart';
import 'package:shop_z/src/features/auth/cupit/LoginCupit.dart';
import 'package:shop_z/src/features/auth/data/AuthRemoteData.dart';
import 'package:shop_z/src/features/auth/repo/AuthRepo.dart';
import 'package:shop_z/src/imports/core_imports.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerLazySingleton<DioService>(
    () => DioService.instance,
  );

  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(
      dio: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      getIt(),
    ),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt(),
    ),
  );
}
