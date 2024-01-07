import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screens.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex= 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index){
          _selectedIndex = index;
          if(mounted){
            setState(() {

            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: 'Wishlist'),
        ],
      ),
    );
  }
}
