/// Centralized route path constants for GoRouter.
///
/// Use these variables instead of raw strings throughout the app.
/// Example: `context.go(AppRoutes.onboarding)` instead of `context.go('/')`.
abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/';
  static const String signup = '/signup';
  static const String productDetails = '/productDetails';
  static const String forgotPassword = '/forgot-password';
  static const String addreses = '/addreses';
}
