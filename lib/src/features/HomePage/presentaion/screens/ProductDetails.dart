import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_z/src/extensions/spAdabt.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

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
            imageUrl:
                'https://images.unsplash.com/photo-1600185364419-1c8b1a7e5c3b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60',
            width: double.infinity,
            height: 340.h,
            fit: BoxFit.cover,
            errorWidget: Icon(Icons.error,
                size: 70.spAdaptive(context), color: Colors.red),
          ),
          20.kH,
          Text(
            'Stylish Sneakers',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold, color: colors.onSurface),
          ),
          13.kH,
          Row(children: [
            Icon(Icons.star, color: Colors.amber, size: 20.spAdaptive(context)),
            4.kW,
            Text('4.0/5',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    decoration: TextDecoration.underline,
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold)),
            10.kW,
            Text('(200 reviews)',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: colors.secondary)),
          ]),
          13.kH,
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                'These stylish sneakers are These stylish sneakers are perfect for everyday wear. With a comfortable fit and trendy design, they will keep you looking great all day long  perfect These stylish sneakers are perfect for everyday wear. With a comfortable fit and trendy design, they will keep you looking great all day long  for everyday wear. With a comfortable fit and trendy design, they will keep you looking great all day long slkdkd kdkd ekkeke kee keek eeke kekew k kek e keke ke ek ek ee eke kk  moimen dknd aonfieie je.',
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
                      Text(r'79.99$',
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
