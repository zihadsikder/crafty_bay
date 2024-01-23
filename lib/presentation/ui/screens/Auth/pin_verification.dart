import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holder/pin_verify_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth/complete_profile.dart';
import 'package:crafty_bay/presentation/ui/utility/colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class PinVerificationScreens extends StatefulWidget {
  const PinVerificationScreens({super.key, required this.email});

  final String email;

  @override
  State<PinVerificationScreens> createState() => _PinVerificationScreensState();
}

class _PinVerificationScreensState extends State<PinVerificationScreens> {
  final TextEditingController _otpTEController = TextEditingController();
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
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'A 4 digit OTP code has been sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primaryColor,
                      selectedFillColor: Colors.transparent,
                      selectedColor: Colors.purple),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    //print("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<VerifyOTPController>(
                    builder: (verifyOtpController) {
                      return Visibility(
                        visible: verifyOtpController.inProgress == false,
                        replacement: const CircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                              final bool response  = await verifyOtpController.verifyOTP(
                                  widget.email, _otpTEController.text);
                              if(response){
                                if(verifyOtpController.shouldNavigateCompleteProfile){
                                  Get.to(const CompleteProfileScreens());
                                }else{
                                  Get.offAll(MainBottomNavController());
                                }

                              }else{
                                Get.showSnackbar(GetSnackBar(
                                    title: 'Send OTP Fail',
                                  message: verifyOtpController.errorMessage,
                                  duration: const Duration(seconds: 2),
                                  isDismissible: true,
                                ));

                              }

                            }

                          },
                          child: const Text('Next'),
                        ),
                      );
                    }
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(text: 'This code will expire '),
                      TextSpan(
                        text: '120s',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}