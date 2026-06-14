import 'package:flutter/material.dart';
import 'package:shop_z/src/extensions/extensions.dart';
import 'package:shop_z/src/features/Address/widgets/AddressCard.dart';

class AddresesScreen extends StatelessWidget {
  const AddresesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Addreses'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            10.kH,
            const Divider(),
            20.kH,
            ListView(
              children: const [
                AddressCard(
                  title: 'Home',
                  subTitle: 'This Sub Location',
                ),
              ],
            )
                .paddingSymmetric(
                  horizontal: context.designTokens.paddingMedium,
                )
                .expanded
          ],
        )));
  }
}
