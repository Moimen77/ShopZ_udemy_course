import 'package:flutter/material.dart';
import 'package:shop_z/src/extensions/context_extension.dart';

class Categoryfilter extends StatelessWidget {
  const Categoryfilter({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.designTokens.paddingMedium,
          vertical: context.designTokens.paddingSmall),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius:
            BorderRadius.circular(context.designTokens.borderRadiusMedium),
        border: Border.all(
            width: 1.3,
            color: context.colors.onSurfaceVariant.withOpacity(0.5)),
      ),
      child: Text(
        title,
        style: context.textTheme.titleMedium!
            .copyWith(color: context.colors.onSurface),
      ),
    );
  }
}
