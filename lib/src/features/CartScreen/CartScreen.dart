import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_z/src/extensions/context_extension.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                                  style:
                                      context.textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Quantity: 1',
                                    style:
                                        context.textTheme.titleSmall!.copyWith(
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
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: colors.onSurfaceVariant),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: colors.onSurface,
                                  ),
                                ),
                                Text('1',
                                    style:
                                        context.textTheme.titleMedium!.copyWith(
                                      color: colors.onSurface,
                                      fontWeight: FontWeight.bold,
                                    )).paddingSymmetric(horizontal: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: colors.onSurfaceVariant),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: colors.onSurface,
                                  ),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement checkout functionality
              },
              child: const Text('Proceed to Checkout'),
            ),
          ],
        ).paddingSymmetric(
          horizontal: context.designTokens.paddingLarge,
          vertical: context.designTokens.paddingMedium,
        ),
      ),
    );
  }
}
