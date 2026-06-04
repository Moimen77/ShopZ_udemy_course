import 'package:flutter/material.dart';
import 'package:shop_z/src/extensions/extensions.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppCachedImage(
            imageUrl: 'https://example.com/product-image.jpg',
            borderRadius: BorderRadius.all(
              Radius.circular(context.designTokens.borderRadiusMedium),
            ),
          ),
        ),
        8.kH,
        Text(
          'Product Name',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold, color: context.colors.onSurface),
        ),
        4.kH,
        Text(
          r'$ 99.99',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500, color: context.colors.secondary),
        ),
      ],
    );
  }
}
