import 'package:advanced_routing_flutter/pages/dashboard/dashboard_controller.dart';
import 'package:advanced_routing_flutter/pages/dashboard/dashboard_page.dart';
import 'package:advanced_routing_flutter/pages/explore/explore_page.dart';
import 'package:advanced_routing_flutter/pages/home/home_controller.dart';
import 'package:advanced_routing_flutter/pages/home/home_page.dart';
import 'package:advanced_routing_flutter/pages/login/login_controller.dart';
import 'package:advanced_routing_flutter/pages/login/login_page.dart';
import 'package:advanced_routing_flutter/pages/profile/profile_controller.dart';
import 'package:advanced_routing_flutter/pages/profile/profile_page.dart';
import 'package:advanced_routing_flutter/pages/root/root_page.dart';
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
        name: RootPage.routeName,
        preventDuplicates: true,
        participatesInRootNavigator: true,
        page: () => RootPage(),
        children: [
          GetPage(
              name: LoginPage.routeName,
              page: () => LoginPage(),
              participatesInRootNavigator: true,
              middlewares: [
                NoAuthCheckMiddleware(),
              ],
              binding: LoginBinding()),
          GetPage(
              name: SettingsPage.routeName,
              page: () => SettingsPage(),
              binding: SettingsBinding()),
          GetPage(
              name: UserPage.routeName,
              page: () => UserPage(),
              middlewares: [AuthCheckMiddleware()],
              binding: UserBinding()),
          GetPage(
            name: DashboardPage.routeName,
            page: () => DashboardPage(),
            binding: DashboardBinding(),
            participatesInRootNavigator: true,
            title: null,
            middlewares: [
              AuthCheckMiddleware(),
            ],
            children: [
              GetPage(
                  name: HomePage.pathName,
                  page: () => HomePage(),
                  participatesInRootNavigator: false,
                  binding: HomeBinding()),
              GetPage(
                  name: ExplorePage.pathName,
                  page: () => ExplorePage(),
                  participatesInRootNavigator: false,
                  binding: ExploreBinding()),
              GetPage(
                  name: ProfilePage.pathName,
                  page: () => ProfilePage(),
                  participatesInRootNavigator: false,
                  binding: ProfileBinding()),
            ],
          ),
        ]),
  ];
}
