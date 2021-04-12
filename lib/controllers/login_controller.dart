import 'package:get/get.dart';
import 'package:izzeddin/models/login_model.dart';
import 'package:izzeddin/services/remote_services.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  int loginRes = -1;

  Future<int> login(String username, String password) async {
    loginRes =-1;
    try {
      loginProcess(true);
      LoginModel loginModel = await RemoteServices().login(username, password);
      if (loginModel.id != -1) {
        //success
        loginRes=loginModel.id;        
      
      } else {
        loginRes = -1;
      }
    } finally {
      loginProcess(false);
    }
    return loginRes;
  }
}