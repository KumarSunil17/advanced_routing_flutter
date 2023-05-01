import 'package:advanced_routing_flutter/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:24 pm
///
class ProfilePage extends GetResponsiveView<ProfileController> {
  static const routeName = '/profile';
  static const pathName = '/home/profile';

  ProfilePage({super.key});
  @override
  Widget? desktop() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to My Profile",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: controller.logout, child: const Text("Logout"))
          ],
        ),
      ),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to My Profile",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: controller.logout, child: const Text("Logout"))
          ],
        ),
      ),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
