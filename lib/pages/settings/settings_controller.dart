import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:35 pm
///
class SettingsController extends GetxController {}

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}
