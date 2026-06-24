import 'package:flutter/material.dart';
import 'package:shop_z/src/extensions/context_extension.dart';

class Categoryfilter extends StatelessWidget {
  const Categoryfilter(
      {super.key,
      required this.title,
      required this.onTap,
      this.isSelected = false});
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.designTokens.paddingMedium,
              vertical: context.designTokens.paddingSmall),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? context.colors.primary : context.colors.surface,
            borderRadius:
                BorderRadius.circular(context.designTokens.borderRadiusMedium),
            border: Border.all(
                width: 1.3,
                color: isSelected
                    ? Colors.transparent
                    : context.colors.onSurfaceVariant.withOpacity(0.5)),
          ),
          child: Text(
            title,
            style: context.textTheme.titleMedium!.copyWith(
                color: isSelected
                    ? context.colors.surface
                    : context.colors.onSurface,
                fontWeight: isSelected ? FontWeight.bold : null),
          ),
        ),
      ),
    );
  }
}
