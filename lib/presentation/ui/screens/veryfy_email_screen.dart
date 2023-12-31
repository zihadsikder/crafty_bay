import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreens extends StatefulWidget {
  const VerifyEmailScreens({super.key});

  @override
  State<VerifyEmailScreens> createState() => _VerifyEmailScreensState();
}

class _VerifyEmailScreensState extends State<VerifyEmailScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 160,),
              const AppLogo(height: 100,),
              const SizedBox(height: 24,),
               Text('Welcome Back',style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 8,),
               Text('Please Enter your email addrees', style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email'
                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Text('Next'))),
            ],
          ),
        ),
      ),
    );
  }
}
