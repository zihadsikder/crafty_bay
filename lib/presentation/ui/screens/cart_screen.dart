import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/cart_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: const Text('Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const CartProductItem();
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 8,
                ),
              ),
            ),
            totalPriceAndCheckOutSection
          ],
        ));
  }

  Container get totalPriceAndCheckOutSection {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price'),
              Text(
                '\$10000.00',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(8.0)),
                  child: const Text('Check out'))
            ],
          )
        ],
      ),
    );
  }
}
