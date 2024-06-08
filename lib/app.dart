import 'package:crafty_bay/presentation/ui/screens/Auth/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controller_binder.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp (
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}


