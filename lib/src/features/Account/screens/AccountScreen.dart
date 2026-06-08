import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_z/src/extensions/context_extension.dart';
import 'package:shop_z/src/extensions/extensions.dart';
import 'package:shop_z/src/features/Account/widget/AccountSetting.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
        ),
        body: SafeArea(
            child: Column(children: [
          const Divider(),
          const AccountSetting(
            title: 'My Orders',
            imgPath: 'assets/icons/Box.svg',
            isdiv: false,
          ),
          const Divider(
            thickness: 8,
          ),
          const AccountSetting(
            title: 'My Details',
            imgPath: 'assets/icons/Details.svg',
            isdiv: true,
          ),
          const AccountSetting(
            title: 'Address Book',
            imgPath: 'assets/icons/Address.svg',
            isdiv: true,
          ),
          const AccountSetting(
            title: 'FAQs',
            imgPath: 'assets/icons/Question.svg',
            isdiv: true,
          ),
          const AccountSetting(
            title: '  Help Center',
            imgPath: 'assets/icons/Headphones.svg',
            isdiv: true,
          ),
          Divider(
            thickness: 8,
            color: context.colors.onSurfaceVariant.withAlpha(100),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Row(children: [
              Icon(Icons.logout_outlined,
                  color: context.colors.error, size: 30.sp),
              16.kW,
              Text(
                'Logout',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: context.colors.error,
                    ),
              ),
              100.kH
            ]).paddingSymmetric(horizontal: context.designTokens.paddingLarge),
          )
        ])));
  }
}
