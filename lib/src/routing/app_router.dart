import 'package:go_router/go_router.dart';
import 'package:shop_z/src/features/auth/presentation/screen/LoginScreen.dart';
import 'package:shop_z/src/features/auth/presentation/screen/SignUp.dart';
import 'package:shop_z/src/routing/global_navigator.dart';
import 'package:shop_z/src/routing/app_routes.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.login,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) => const SignUp(),
    ),
  ],
);
