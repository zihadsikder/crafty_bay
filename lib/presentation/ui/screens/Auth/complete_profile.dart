import 'package:crafty_bay/presentation/ui/screens/bottom_nevigation.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreens extends StatefulWidget {
  const CompleteProfileScreens({super.key});

  @override
  State<CompleteProfileScreens> createState() => _CompleteProfileScreensState();
}

class _CompleteProfileScreensState extends State<CompleteProfileScreens> {

  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastnameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _sAddressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 160,),
                const AppLogo(height: 100,),
                const SizedBox(height: 24,),
                 Text('Complete Your Profile',style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 8,),
                 Text('Get Start with us with your details', style: Theme.of(context).textTheme.titleSmall,),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _firstnameTEController,
                  decoration: const InputDecoration(
                    hintText: 'First Name'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  controller: _lastnameTEController,
                  decoration: const InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),
                const SizedBox(height: 8,),

                TextFormField(
                  controller: _mobileTEController,
                  decoration: const InputDecoration(
                      hintText: 'Mobile'
                  ),
                ),
                const SizedBox(height: 8,),

                TextFormField(
                  controller: _cityTEController,
                  decoration: const InputDecoration(
                      hintText: 'City'
                  ),
                ),
                const SizedBox(height: 8,),

                TextFormField(
                  controller: _sAddressTEController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      hintText: 'Shipping Address'
                  ),
                ),

                const SizedBox(height: 16,),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){

                      }
                      Get.offAll(const BottomNavigationScreen());
                    }, child:const Text('Complete'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
