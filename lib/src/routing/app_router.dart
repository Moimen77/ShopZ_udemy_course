import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_z/src/features/Address/screen/AddresesScreen.dart';
import 'package:shop_z/src/features/HomePage/models/productModel.dart';
import 'package:shop_z/src/features/HomePage/presentaion/screens/ProductDetails.dart';
import 'package:shop_z/src/features/HomeScreen.dart/screen/HomeScreen.dart';
import 'package:shop_z/src/features/auth/cupit/LoginCupit.dart';
import 'package:shop_z/src/features/auth/presentation/screen/LoginScreen.dart';
import 'package:shop_z/src/features/auth/presentation/screen/SignUp.dart';
import 'package:shop_z/src/features/auth/repo/AuthRepo.dart';
import 'package:shop_z/src/imports/core_imports.dart';
import 'package:shop_z/src/services/injectionContainer.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.login,
  redirect: (context, state) async {
    final isLoggedIn = (await getIt<SecureStorageService>().read('token')).fold(
      (_) => false,
      (token) => token?.isNotEmpty ?? false,
    );

    final isGoingToHome = state.matchedLocation == AppRoutes.home;
    final isGoingToLogin = state.matchedLocation == AppRoutes.login;

    if (isLoggedIn && !isGoingToHome && isGoingToLogin) {
      return AppRoutes.home;
    }

    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => BlocProvider(
        create: (_) => LoginCubit(
          getIt<AuthRepository>(),
        ),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const Homescreen(),
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      name: AppRoutes.productDetails,
      builder: (context, state) => ProductDetailsScreen(
        product: state.extra as products,
      ),
    ),
    GoRoute(
      path: AppRoutes.addreses,
      name: AppRoutes.addreses,
      builder: (context, state) => const AddresesScreen(),
    ),
  ],
);
