import 'package:advanced_routing_flutter/pages/explore/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:24 pm
///
class ExplorePage extends GetResponsiveView<ExploreController> {
  static const routeName = '/home/explore';
  static const pathName = '/explore';

  ExplorePage({super.key});
  @override
  Widget? desktop() {
    return Scaffold(
      body: Center(child: Text("Explore")),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      body: Center(child: Text("Explore")),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
