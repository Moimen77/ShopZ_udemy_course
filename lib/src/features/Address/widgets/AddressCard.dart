import 'package:flutter/material.dart';
import 'package:shop_z/src/extensions/extensions.dart';
import 'package:shop_z/src/extensions/spAdabt.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.designTokens.paddingLarge,
            vertical: context.designTokens.paddingMedium),
        decoration: BoxDecoration(
            borderRadius: 12.radius,
            border: Border.all(
              color: colors.onSurfaceVariant,
            )),
        child: Row(
          children: [
            Icon(Icons.location_on,
                size: 24.spAdaptive(context), color: colors.secondary),
            10.kW,
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    'Home',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: colors.onSurface),
                  ),
                  5.kH,
                  Text(
                    ' jsjsjss js sjsssjssjs jsjs',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: colors.onSurface),
                  ),
                ]))
          ],
        ));
  }
}
