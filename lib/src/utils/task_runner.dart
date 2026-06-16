import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shop_z/src/imports/core_imports.dart';

FutureEither<T> runTask<T>(
  Future<T> Function() action, {
  bool requiresNetwork = false,
}) async {
  if (requiresNetwork) {
    final hasNetwork = await InternetConnectionService().hasConnection();

    if (!hasNetwork) {
      AppLogger.warning('Network unavailable for task');
      showGlobalToast(
        message:
            'No internet connection. Please check your connection and try again.',
        status: 'warning',
      );
      return left(
        const NetworkFailure(
          'No internet connection. Please check your connection and try again.',
        ),
      );
    }
  }
  try {
    final result = await action();

    return right(result);
  } on Failure catch (failure, stackTrace) {
    AppLogger.error(
      failure.message,
      [failure, stackTrace],
    );

    return left(failure);
  } on DioException catch (e) {
    final message = e.response?.data?.toString();
    if (message == 'username or password is incorrect') {
      return left(
        const AuthFailure(
          'Username or password is incorrect',
        ),
      );
    }
    return left(
      const ServerFailure(
        'Something went wrong , please try again later',
      ),
    );
  } catch (error, stackTrace) {
    AppLogger.error(
      'Task execution failed',
      [error, stackTrace],
    );

    return left(
      const ServerFailure(
        'Something went wrong , please try again later',
      ),
    );
  }
}
