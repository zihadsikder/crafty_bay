import 'package:crafty_bay/presentation/ui/utility/colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);
  List<Color> colors = [
    Colors.redAccent,
    Colors.black,
    Colors.black12,
    Colors.grey,
    Colors.lightGreen,
  ];
  List<String> sizes = [
    'S',
    'L',
    'M',
    'XL',
    'XXL',
    'XXXL',
  ];
  Color _selectedColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const ProductImageCarousel(),
                productDetailsBody
              ],
            ),
          ),
          priceAndAddToCart
        ],
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Iphone 15 pro max - Save 30%",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
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
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Wrap(children: [
                          Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.amber,
                          ),
                          Text('4.8',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                  fontSize: 16)),
                        ],),
                        const SizedBox(width:8.0),
                        TextButton(onPressed: (){},
                            child: const Text('Reviews',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor),)),
                        Card(
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.favorite_outline,size: 12,color: Colors.white,),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Color',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    ColorSelector(
                      colors: colors,
                      onChange: (selectedColor) {
                        _selectedColor = selectedColor;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Size',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizeSelector(sizes: sizes, onChange: (s) {}),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
    );
  }

  Container get priceAndAddToCart {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
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
                  child: const Text('Add To Cart'))
            ],
          )
        ],
      ),
    );
  }
}




