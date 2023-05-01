import 'package:advanced_routing_flutter/pages/dashboard/dashboard_page.dart';
import 'package:advanced_routing_flutter/pages/login/login_page.dart';
import 'package:advanced_routing_flutter/pages/profile/profile_controller.dart';
import 'package:advanced_routing_flutter/utils/app_pref_helper.dart';
import 'package:get/get.dart';

class AuthCheckMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    print("HEHE ${LoginPage.getPath(route.pageSettings?.path)}");
    final userController = Get.isRegistered<ProfileController>()
        ? Get.find<ProfileController>()
        : Get.put<ProfileController>(ProfileController(), permanent: true);
    final token = SharedPreferenceHelper.accessToken;
    if (token != null && token.isNotEmpty) {
      userController.updateUser(token);
      return route;
    } else {
      return RouteDecoder.fromRoute(
          LoginPage.getPath(route.pageSettings?.path));
    }
  }
}

class NoAuthCheckMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    final userController = Get.isRegistered<ProfileController>()
        ? Get.find<ProfileController>()
        : Get.put<ProfileController>(ProfileController(), permanent: true);
    final token = SharedPreferenceHelper.accessToken;
    if (token != null) {
      userController.updateUser(token);
      return RouteDecoder.fromRoute(DashboardPage.routeName);
    } else {
      return route;
    }
  }
}
