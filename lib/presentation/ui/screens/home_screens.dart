import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/utility/colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/Home/categories_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/Home/circle_icon_buttton.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextField,
              const SizedBox(
                height: 16,
              ),
              const BannerCarousel(),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {},
              ),
          categoryList,
          const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: 'Popular',
                onTapSeeAll: () {},
              ),
              popularProductList,
              const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: 'Spacial',
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'New',
                onTapSeeAll: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: 10,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index) {
              return const CategoriesItem(
                  iconData: Icons.computer,
                  title: 'Electronics');
            }, separatorBuilder: (_, __) {
              return const SizedBox(width: 8.0,);
          },
          ),
        );
  }
  SizedBox get popularProductList {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return Card(

            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Image.asset(AssetsPath.popular,width: 80,),


          );
        }, separatorBuilder: (_, __) {
        return const SizedBox(width: 8.0,);
      },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset(AssetsPath.navLogo,width: 110,),
      actions: [
        CircleIconButton(
          onTap: () {},
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
      ],
    );
  }
}
