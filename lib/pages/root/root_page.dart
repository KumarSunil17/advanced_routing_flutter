import 'package:advanced_routing_flutter/pages/dashboard/dashboard_page.dart';
import 'package:advanced_routing_flutter/pages/root/root_controller.dart';
import 'package:advanced_routing_flutter/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:24 pm
///
class RootPage extends GetResponsiveView<RootController> {
  static const routeName = '/';

  RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterOutlet.builder(
      delegate: Get.nestedKey(null),
      builder: (context) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: FloatingActionButton(
              onPressed: () {
                if (Get.currentRoute != SettingsPage.routeName) {
                  Get.toNamed(SettingsPage.routeName);
                }
              },
              child: const Icon(Icons.settings_outlined),
            ),
          ),
          body: GetRouterOutlet(
            initialRoute: DashboardPage.routeName,
            delegate: Get.nestedKey(null),
            anchorRoute: '/',
            filterPages: (afterAnchor) {
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}
