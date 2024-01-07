import 'package:crafty_bay/presentation/ui/screens/Auth/veryfy_email_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }
  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(const VerifyEmailScreens());

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 8.0,),
            Text('Version 1.0'),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
