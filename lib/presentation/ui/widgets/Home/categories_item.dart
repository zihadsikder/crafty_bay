import 'package:crafty_bay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final IconData iconData;
  final String title;

  const CategoriesItem({super.key, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Card(
          elevation: 0,
          color: AppColors.primaryColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              iconData,
              size: 32,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
