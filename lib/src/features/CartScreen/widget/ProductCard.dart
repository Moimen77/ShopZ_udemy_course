import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_z/src/features/CartScreen/widget/iconButtonOutline.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.designTokens.borderRadiusSmall),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.onSurfaceVariant),
        ),
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCachedImage(
              imageUrl: 'https://via.placeholder.com/150',
              borderRadius: BorderRadius.all(
                  Radius.circular(context.designTokens.borderRadiusMedium)),
              width: 83.w,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name',
                            style: context.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Quantity: 1',
                              style: context.textTheme.titleSmall!.copyWith(
                                color: colors.secondary,
                              ))
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Text(
                        r'$29.99',
                        style: context.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButtonOutline(
                            icon: Icons.add,
                            onPressed: () {},
                          ),
                          Text('1',
                              style: context.textTheme.titleMedium!.copyWith(
                                color: colors.onSurface,
                                fontWeight: FontWeight.bold,
                              )).paddingSymmetric(horizontal: 10),
                          IconButtonOutline(
                            icon: Icons.remove,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
