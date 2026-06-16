import 'package:shop_z/src/config/AppEndPoint.dart';
import 'package:shop_z/src/features/auth/data/model/LoginResModel.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class AuthRemoteDataSource {
  final DioService dio;

  AuthRemoteDataSource({required this.dio});

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    final response = await dio.post(
      AppEndPoint.Login,
      data: {
        'username': username,
        'password': password,
      },
    );

    return response.fold((faliure) {
      throw faliure;
    }, (res) {
      return LoginResponse.fromJson(res.data);
    });
  }
}
