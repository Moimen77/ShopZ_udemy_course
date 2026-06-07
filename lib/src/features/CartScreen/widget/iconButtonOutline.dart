import 'package:flutter/material.dart';
import 'package:shop_z/src/extensions/context_extension.dart';

class IconButtonOutline extends StatelessWidget {
  const IconButtonOutline(
      {super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colors.onSurfaceVariant),
        ),
        child: Icon(
          icon,
          color: colors.onSurface,
        ),
      ),
    );
  }
}
