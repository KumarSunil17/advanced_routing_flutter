import 'package:advanced_routing_flutter/pages/settings/settings_controller.dart';
import 'package:advanced_routing_flutter/pages/user/user_page.dart';
import 'package:advanced_routing_flutter/utils/app_dynamic_link_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:24 pm
///
class SettingsPage extends GetResponsiveView<SettingsController> {
  static const routeName = '/settings';

  SettingsPage({super.key});
  @override
  Widget? desktop() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Share Login link"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink("/login");
            },
          ),
          ListTile(
            title: const Text("Share Login link from profile"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink(
                  "/login?redirectUrl=/profile");
            },
          ),
          ListTile(
            title: const Text("Share Explore link"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink("/explore");
            },
          ),
          ListTile(
            title: const Text("Share Profile link"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink(
                  "/login?redirectUrl=/profile");
            },
          ),
          ListTile(
            title: const Text("Share User link"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink(
                  UserPage.getPath("1234"));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Share Login link"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink("/login");
            },
          ),
          ListTile(
            title: const Text("Share Login link from profile"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink(
                  "/login?redirectUrl=/profile");
            },
          ),
          ListTile(
            title: const Text("Share Explore link"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink("/explore");
            },
          ),
          ListTile(
            title: const Text("Share Profile link"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink(
                  "/login?redirectUrl=/profile");
            },
          ),
          ListTile(
            title: const Text("Share User link"),
            onTap: () {
              AppDynamicLinkHelper.generateDynamicLink(
                  UserPage.getPath("1234"));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
