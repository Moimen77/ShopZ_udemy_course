// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shop_z/src/extensions/spAdabt.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            const AppTextField(
              hint: 'Enter your email address',
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
            const AppTextField(
              hint: 'Enter your password',
              obscureText: true,
              suffixIcon: Icon(Icons.visibility_off_outlined),
            ),
            55.kH,
            AppButton(
              label: 'Login',
              onPressed: () {},
              variant: ButtonVariant.primary,
              width: ButtonSize.large,
              height: ButtonSize.large,
            ).center,
            const Spacer(),
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
                Text(
                  'Sign Up',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ).paddingSymmetric(
            vertical: context.designTokens.paddingMedium.spAdaptive(context),
            horizontal: context.designTokens.paddingLarge.spAdaptive(context)),
      ),
    );
  }
}
