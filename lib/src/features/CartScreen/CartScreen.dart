import 'package:shop_z/src/features/CartScreen/widget/PriceRowDetails.dart';
import 'package:shop_z/src/imports/core_imports.dart';
import 'widget/ProductCard.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProductCard(),
            ProductCard(),
            ProductCard(),
            const SizedBox(height: 20),
            const PriceRowDetails(
              Title: 'Sub-total',
              Price: r'5870.0 $',
            ),
            const PriceRowDetails(
              Title: 'VAT (%)',
              Price: r'0.0 $',
            ),
            const PriceRowDetails(
              Title: 'Shipping fee',
              Price: r'80.0 $',
            ),
            const Divider(),
            const PriceRowDetails(
              Title: 'Total',
              Price: r'5950.0 $',
            ),
            const Spacer(),
            AppButton(
              label: 'Go To Checkout',
              onPressed: () {},
              variant: ButtonVariant.primary,
              height: ButtonSize.large,
              isFullWidth: true,
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
