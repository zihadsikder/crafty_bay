import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          child: Row(
            children: [
              Image.asset(
                AssetsPath.product,
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Iphone 15 2023 Edition',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Row(
                              children: [
                                Text('Color: Red'),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Size: XL'),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_forever_outlined))
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '\$114000',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor),
                      ),
                      const Spacer(),
                      ValueListenableBuilder(
                          valueListenable: noOfItems,
                          builder: (context, value, _) {
                            /// TODO - Design a item counter
                            return ItemCount(
                              initialValue: value,
                              minValue: 1,
                              maxValue: 20,
                              decimalPlaces: 0,
                              step: 1,
                              color: AppColors.primaryColor,
                              onChanged: (v) {
                                noOfItems.value = v.toInt();
                              },
                            );
                          }),
                    ],
                  )
                ],
              ))
            ],
          ),
        )
      ],
    );
  }
}
