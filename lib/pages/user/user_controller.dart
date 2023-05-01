import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:35 pm
///
class UserController extends GetxController {
  late String userId;
  @override
  void onInit() {
    userId = Get.parameters["id"] ?? "";

    super.onInit();
  }
}

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
