import 'package:crafty_bay/data/services/netword_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;
  
  Future<bool> createProfile(String firstname, String lastname, String mobile, String city, String sAddress) async{
    _inProgress = true;
    update();
     Map<String, dynamic> inputParams = {
       "firstName": firstname,
       "lastName": lastname,
       "mobile": mobile,
       "city": city,
       "shippingAddress": sAddress,
     };
    final response = await NetworkCaller()
        .postRequest(Urls.completeProfile, body : inputParams);
    _inProgress = false;
    if(response.isSuccess){
      update();
      return true;
    }else{
      _errorMessage = response.errorMessage;
      return false;
    }

  }

}