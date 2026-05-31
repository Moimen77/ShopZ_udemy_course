import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_z/src/extensions/spAdabt.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create an account',
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
                'Full Name',
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.kH,
              const AppTextField(
                hint: 'Enter your full name',
              ),
              16.kH,
              Text(
                'Email',
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.kH,
              const AppTextField(
                hint: 'Enter your email address',
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
              16.kH,
              Text(
                'Confirm Password',
                style: context.textTheme.titleMedium!.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.kH,
              const AppTextField(
                hint: 'Confirm your password',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
              42.kH,
              AppButton(
                label: 'Create Account',
                onPressed: () {},
                variant: ButtonVariant.primary,
                width: ButtonSize.large,
                height: ButtonSize.large,
              ).center,
              SizedBox(height: 100.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  4.kW,
                  GestureDetector(
                    child: Text(
                      'Sign In',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      context.pop();
                    },
                  ),
                ],
              )
            ],
          ).paddingSymmetric(
              vertical: context.designTokens.paddingMedium.spAdaptive(context),
              horizontal:
                  context.designTokens.paddingLarge.spAdaptive(context)),
        ),
      ),
    );
  }
}
