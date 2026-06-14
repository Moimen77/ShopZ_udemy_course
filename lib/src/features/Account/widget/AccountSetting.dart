import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_z/src/imports/imports.dart';
import 'package:shop_z/src/shared/shared.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting(
      {super.key,
      required this.title,
      required this.imgPath,
      required this.isdiv,
      this.ontap});
  final String title;
  final String imgPath;
  final bool isdiv; // is this divider
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.designTokens.paddingLarge,
                horizontal: context.designTokens.paddingLarge),
            child: Row(
              children: [
                SvgPicture.asset(
                  imgPath,
                  width: 25.sp,
                  height: 25.sp,
                  colorFilter:
                      ColorFilter.mode(colors.onSurface, BlendMode.srcIn),
                ),
                16.kW,
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: colors.onSurface,
                      ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: colors.secondary,
                ),
              ],
            ),
          ),
        ),
        if (isdiv) const Divider() else const SizedBox.shrink()
      ],
    );
  }
}
