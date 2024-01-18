import 'package:ecommerce_app/Core/utils/styles.dart';
import 'package:ecommerce_app/Features/home/presentation/views/product_screen_view.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/categories_view.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/order_text.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/products_view_list.dart';
import 'package:ecommerce_app/Features/home/presentation/views/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const WelcomeText(),
                const OrderText(),
                const SizedBox(
                  height: 10,
                ),
                const CustomSearchBar(),
                const SizedBox(
                  height: 12,
                ),
                const CategoriesView(),
                Row(
                  children: [
                    const Text('Popular', style: Styles.categTitle),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Get.to(const ProductScreenView());
                        },
                        child: const Text('View all'))
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ProductsView(),
          ),
        ),
      ],
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
