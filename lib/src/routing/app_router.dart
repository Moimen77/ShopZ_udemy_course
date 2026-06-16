import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_z/src/features/Address/screen/AddresesScreen.dart';
import 'package:shop_z/src/features/HomePage/presentaion/screens/ProductDetails.dart';
import 'package:shop_z/src/features/HomeScreen.dart/screen/HomeScreen.dart';
import 'package:shop_z/src/features/auth/cupit/LoginCupit.dart';
import 'package:shop_z/src/features/auth/presentation/screen/LoginScreen.dart';
import 'package:shop_z/src/features/auth/presentation/screen/SignUp.dart';
import 'package:shop_z/src/features/auth/repo/AuthRepo.dart';
import 'package:shop_z/src/routing/global_navigator.dart';
import 'package:shop_z/src/routing/app_routes.dart';
import 'package:shop_z/src/services/injectionContainer.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.login,
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
      builder: (context, state) => const ProductDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.addreses,
      name: AppRoutes.addreses,
      builder: (context, state) => const AddresesScreen(),
    ),
  ],
);
