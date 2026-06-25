import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_z/src/extensions/spAdabt.dart';
import 'package:shop_z/src/features/HomePage/models/productModel.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final products product;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCachedImage(
            imageUrl: product.image!,
            width: double.infinity,
            height: 340.h,
            fit: BoxFit.contain,
            errorWidget: Icon(Icons.error,
                size: 70.spAdaptive(context), color: Colors.red),
          ),
          20.kH,
          Text(
            product.title ?? 'N/a',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold, color: colors.onSurface),
          ),
          13.kH,
          Row(children: [
            Icon(Icons.star, color: Colors.amber, size: 20.spAdaptive(context)),
            4.kW,
            Text('${product.rating?.rate}/5',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    decoration: TextDecoration.underline,
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold)),
            10.kW,
            Text('(${product.rating?.count} reviews)',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: colors.secondary)),
          ]),
          13.kH,
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                product.description ?? 'N/A',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          15.kH,
          Column(
            children: [
              Divider(thickness: 1, color: colors.onSurfaceVariant),
              5.kH,
              Row(
                children: [
                  Column(
                    children: [
                      Text('Price',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: colors.secondary,
                                  )),
                      4.kH,
                      Text('${product.price}\$',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                color: colors.onSurface,
                              )),
                    ],
                  ),
                  25.kW,
                  Expanded(
                    child: AppButton(
                      label: 'Add to Cart',
                      onPressed: () {
                        // Handle add to cart action
                      },
                      prefixIcon: const Icon(Icons.shopping_cart),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 20)),
    );
  }
}
