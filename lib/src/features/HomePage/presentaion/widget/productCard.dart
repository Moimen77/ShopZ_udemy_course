import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_z/src/features/HomePage/models/productModel.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            imageUrl: product.image!,
            height: 100.h,
            fit: BoxFit.contain,
            borderRadius: BorderRadius.all(
              Radius.circular(context.designTokens.borderRadiusMedium),
            ),
          ),
        ),
        8.kH,
        Text(
          product.title ?? 'Product Name',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold, color: context.colors.onSurface),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
