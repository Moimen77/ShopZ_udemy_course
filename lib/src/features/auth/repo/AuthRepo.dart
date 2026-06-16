import 'package:shop_z/src/features/auth/data/AuthRemoteData.dart';
import 'package:shop_z/src/features/auth/data/model/LoginResModel.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepository(
    this.remote,
  );

  FutureEither<LoginResponse> login({
    required String username,
    required String password,
  }) {
    return runTask(
      () => remote.login(
        username: username,
        password: password,
      ),
      requiresNetwork: true,
    );
  }
}
