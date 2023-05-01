import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:35 pm
///
class HomeController extends GetxController {}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
