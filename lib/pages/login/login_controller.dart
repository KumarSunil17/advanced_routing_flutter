import 'package:advanced_routing_flutter/pages/dashboard/dashboard_page.dart';
import 'package:advanced_routing_flutter/pages/profile/profile_controller.dart';
import 'package:advanced_routing_flutter/utils/app_pref_helper.dart';
import 'package:advanced_routing_flutter/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:35 pm
///
class LoginController extends GetxController {
  String? email, password;
  Rx<AutovalidateMode> autoValidateMode = Rx(AutovalidateMode.disabled);

  void emailSaved(String? value) {
    email = value?.trim();
  }

  void passwordSaved(String? value) {
    password = value?.trim();
  }

  void login(GlobalKey<FormState> formKey) {
    final state = formKey.currentState;
    if (state == null) return;
    if (state.validate()) {
      state.save();

      final redirectUrl = Get.parameters["redirectUrl"];
      if (email == "sunil@gmail.com" && password == "128") {
        SharedPreferenceHelper.storeAccessToken("sunil@12345678");
        Get.find<ProfileController>().updateUser("sunil@12345678");
        Get.offNamed(redirectUrl ?? DashboardPage.routeName);
      } else {
        SnackBarHelper.show("Invalid email id and password.");
      }
    } else {
      autoValidateMode.value = AutovalidateMode.always;
    }
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
