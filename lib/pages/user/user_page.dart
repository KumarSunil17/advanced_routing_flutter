import 'package:advanced_routing_flutter/pages/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:24 pm
///
class UserPage extends GetResponsiveView<UserController> {
  static const routeName = '/user/:id';
  static String getPath(String id) => '/user/$id';
  UserPage({super.key});
  @override
  Widget? desktop() {
    return Scaffold(
      body: Center(child: Text("User ${controller.userId}")),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      body: Center(child: Text("User ${controller.userId}")),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
