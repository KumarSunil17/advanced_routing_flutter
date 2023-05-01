import 'package:advanced_routing_flutter/pages/login/login_page.dart';
import 'package:advanced_routing_flutter/utils/app_pref_helper.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:35 pm
///
class ProfileController extends GetxController with StateMixin<String> {
  void updateUser(String user) {
    change(GetStatus.success(user));
  }

  void logout() {
    SharedPreferenceHelper.logout();
    Get.offAllNamed(LoginPage.routeName);
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
