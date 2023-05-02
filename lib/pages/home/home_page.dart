import 'package:advanced_routing_flutter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:24 pm
///
class HomePage extends GetResponsiveView<HomeController> {
  static const routeName = '/home/dashboard';
  static const pathName = '/dashboard';

  HomePage({super.key});
  @override
  Widget? desktop() {
    return Scaffold(
      body: Center(child: Text("Home")),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      body: Center(child: Text("Home")),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
