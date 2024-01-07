import 'package:flutter/material.dart';

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
        title: Text('wish'),
        actions: [
          Image.asset('assets/images/logo_nav.png'),
        ],
      ),
    );
  }
}
