import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_z/src/features/auth/cupit/LoginStates.dart';
import 'package:shop_z/src/features/auth/repo/AuthRepo.dart';
import 'package:shop_z/src/imports/core_imports.dart';
import 'package:shop_z/src/services/injectionContainer.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit(this.repository) : super(const LoginState());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: AppStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await repository.login(
      username: username,
      password: password,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: AppStatus.failure,
            errorMessage: failure.message,
            failure: failure,
          ),
        );
      },
      (response) async {
        await getIt<SecureStorageService>().write('token', response.token);
        emit(
          state.copyWith(
            status: AppStatus.success,
          ),
        );
      },
    );
  }
}
