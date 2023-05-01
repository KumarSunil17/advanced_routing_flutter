import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:35 pm
///
class DashboardController extends GetxController {}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
