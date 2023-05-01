import 'package:advanced_routing_flutter/pages/dashboard/dashboard_controller.dart';
import 'package:advanced_routing_flutter/pages/dashboard/dashboard_page.dart';
import 'package:advanced_routing_flutter/pages/explore/explore_page.dart';
import 'package:advanced_routing_flutter/pages/home/home_controller.dart';
import 'package:advanced_routing_flutter/pages/home/home_page.dart';
import 'package:advanced_routing_flutter/pages/login/login_controller.dart';
import 'package:advanced_routing_flutter/pages/login/login_page.dart';
import 'package:advanced_routing_flutter/pages/profile/profile_controller.dart';
import 'package:advanced_routing_flutter/pages/profile/profile_page.dart';
import 'package:advanced_routing_flutter/pages/settings/settings_controller.dart';
import 'package:advanced_routing_flutter/pages/settings/settings_page.dart';
import 'package:advanced_routing_flutter/pages/unknown/unknown_page.dart';
import 'package:advanced_routing_flutter/pages/user/user_controller.dart';
import 'package:advanced_routing_flutter/pages/user/user_page.dart';
import 'package:advanced_routing_flutter/utils/app_middlewares.dart';
import 'package:get/get.dart';

import '../pages/explore/explore_controller.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:30 pm
///
class AppPages {
  static final unknownPage =
      GetPage(name: UnknownPage.routeName, page: () => UnknownPage());

  static final pages = [
    GetPage(
        name: LoginPage.routeName,
        page: () => LoginPage(),
        middlewares: [
          NoAuthCheckMiddleware(),
        ],
        binding: LoginBinding()),
    GetPage(
        name: SettingsPage.routeName,
        page: () => SettingsPage(),
        binding: SettingsBinding()),
    GetPage(
      name: DashboardPage.routeName,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      title: null,
      middlewares: [
        AuthCheckMiddleware(),
      ],
      children: [
        GetPage(
            name: HomePage.routeName,
            page: () => HomePage(),
            participatesInRootNavigator: false,
            binding: HomeBinding()),
        GetPage(
            name: ExplorePage.routeName,
            page: () => ExplorePage(),
            participatesInRootNavigator: false,
            binding: ExploreBinding()),
        GetPage(
            name: ProfilePage.routeName,
            page: () => ProfilePage(),
            participatesInRootNavigator: false,
            binding: ProfileBinding()),
      ],
    ),
    GetPage(
        name: UserPage.routeName,
        page: () => UserPage(),
        participatesInRootNavigator: true,
        middlewares: [AuthCheckMiddleware()],
        binding: UserBinding()),
  ];
}
