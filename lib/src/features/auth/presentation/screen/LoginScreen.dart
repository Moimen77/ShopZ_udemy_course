import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_z/src/extensions/extensions.dart';
import 'package:shop_z/src/extensions/spAdabt.dart';
import 'package:shop_z/src/features/auth/cupit/LoginCupit.dart';
import 'package:shop_z/src/features/auth/cupit/LoginStates.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          showGlobalToast(
            message: state.errorMessage ?? 'Something went wrong',
            status: 'error',
          );
        }
        if (state.status.isSuccess) {
          context.go(AppRoutes.home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login to your account',
                    style: context.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colors.onSurface,
                    ),
                  ),
                  10.kH,
                  Text(
                    'It’s great to see you again.',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colors.secondary,
                    ),
                  ),
                  24.kH,
                  Text(
                    'User Name',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.kH,
                  AppTextField(
                    controller: usernameController,
                    hint: 'Enter your username',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  16.kH,
                  Text(
                    'Password',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.kH,
                  AppTextField(
                    controller: passwordController,
                    hint: 'Enter your password',
                    obscureText: true,
                    suffixIcon: const Icon(
                      Icons.visibility_off_outlined,
                    ),
                  ),
                  55.kH,
                  AppButton(
                    label: 'Login',
                    isLoading: state.status.isLoading,
                    onPressed: state.status.isLoading
                        ? null
                        : () {
                            context.read<LoginCubit>().login(
                                  username: usernameController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                          },
                    variant: ButtonVariant.primary,
                    width: ButtonSize.large,
                    height: ButtonSize.large,
                  ).center,
                  SizedBox(height: 260.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                      4.kW,
                      GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.signup);
                        },
                        child: Text(
                          'Sign Up',
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(
                vertical:
                    context.designTokens.paddingMedium.spAdaptive(context),
                horizontal:
                    context.designTokens.paddingLarge.spAdaptive(context),
              ),
            ),
          ),
        );
      },
    );
  }
}
