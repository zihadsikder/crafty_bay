import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/Home/product_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
        },
        ),
        title: const Text('wishlist'),
        actions: [
          Image.asset('assets/images/logo_nav.png'),
        ],
      ),
      body: GridView.builder(
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.90,
          mainAxisSpacing: 8,
          crossAxisSpacing: 4
        ),
        itemBuilder: (context, index) {
          return const FittedBox(child: ProductCartItem()) ;
        },
      ),
    );
  }
}
