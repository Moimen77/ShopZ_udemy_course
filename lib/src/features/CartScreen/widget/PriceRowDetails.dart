// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shop_z/src/extensions/context_extension.dart';

class PriceRowDetails extends StatelessWidget {
  const PriceRowDetails({super.key, required this.Title, required this.Price});
  final String Title;
  final String Price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.designTokens.borderRadiusSmall),
      child: Row(
        children: [
          Text(
            Title,
            style: context.textTheme.titleMedium!.copyWith(
              color: context.colors.secondary,
            ),
          ),
          const Spacer(),
          Text(
            Price,
            style: context.textTheme.titleMedium!.copyWith(
              color: context.colors.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
