import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_z/src/features/HomePage/cubit/HomePageCubit.dart';
import 'package:shop_z/src/features/HomePage/cubit/HomepageStates.dart';
import 'package:shop_z/src/features/HomePage/presentaion/widget/CategoryFilter.dart';
import 'package:shop_z/src/features/HomePage/presentaion/widget/productCard.dart';
import 'package:shop_z/src/imports/core_imports.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<Homepagecubit>().getproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Discover',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w600,
                              color: context.colors.onSurface)),
                ),
                16.kH,
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: AppTextField(
                        hint: 'Search for clothes...',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    10.kW,
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                20.kH,
              ],
            ).paddingSymmetric(
              horizontal: context.designTokens.paddingLarge,
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(
                left: context.designTokens.paddingLarge,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Categoryfilter(
                      title: 'All',
                    ),
                    Categoryfilter(
                      title: 'Shirts',
                    ),
                    Categoryfilter(
                      title: 'Pants',
                    ),
                    Categoryfilter(
                      title: 'Shoes',
                    ),
                    Categoryfilter(
                      title: 'Accessories',
                    ),
                  ].separatedBy(8.kW).toList(),
                ),
              ),
            ),
            20.kH,
            Expanded(
              child: BlocBuilder<Homepagecubit, Homepagestates>(
                builder: (context, state) {
                  if (state.status == AppStatus.loading) {
                    return const Center(
                      child: AppLoading(),
                    );
                  }

                  if (state.status == AppStatus.failure) {
                    return Center(
                      child: Text(
                        state.faliure?.message ?? 'Something went wrong',
                      ),
                    );
                  }

                  final products = state.productRes ?? [];

                  if (products.isEmpty) {
                    return const Center(
                      child: Text('No products found'),
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.designTokens.paddingLarge,
                    ),
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.productDetails,
                              extra: product,
                            );
                          },
                          child: ProductCard(
                            product: product,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
