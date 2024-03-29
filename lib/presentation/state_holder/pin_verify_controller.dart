import 'package:crafty_bay/data/services/netword_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holder/read_profile_data_controller.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage ='';
  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  Future<bool> verifyOTP(String email, String otp) async{
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.verifyOtp(email,otp));
    _inProgress = false;

    if(response.isSuccess){
      final token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 3));
      final result = await Get.find<ReadProfileController>().readProfileData(token);
      if(result){
        _shouldNavigateCompleteProfile = Get.find<ReadProfileController>().isProfileCompleted == false;
      }else{
        _errorMessage =Get.find<ReadProfileController>().errorMessage;
        update();
        return false;
      }
      update();
      return true;
    }else{
      _errorMessage = response.errorMessage;
      update();
      return false;
    }


  }
}