import 'package:shop_z/src/imports/core_imports.dart';

class LoginState {
  final AppStatus status;
  final Failure? failure;
  final String? errorMessage;

  const LoginState({
    this.status = AppStatus.initial,
    this.errorMessage,
    this.failure,
  });

  LoginState copyWith({
    AppStatus? status,
    String? errorMessage,
    Failure? failure,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      failure: failure,
    );
  }
}
