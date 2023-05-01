import 'package:advanced_routing_flutter/pages/dashboard/dashboard_controller.dart';
import 'package:advanced_routing_flutter/pages/explore/explore_page.dart';
import 'package:advanced_routing_flutter/pages/home/home_page.dart';
import 'package:advanced_routing_flutter/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:24 pm
///
class DashboardPage extends GetResponsiveView<DashboardController> {
  static const routeName = '/';

  DashboardPage({super.key});
  @override
  Widget? desktop() {
    return GetRouterOutlet.builder(
        routerDelegate: Get.nestedKey(DashboardPage.routeName),
        builder: (context) {
          final delegate = context.navigation;
          final currentLocation = context.location;
          int currentIndex = 0;
          if (currentLocation.startsWith(ExplorePage.routeName) == true) {
            currentIndex = 1;
          }
          if (currentLocation.startsWith(ProfilePage.routeName) == true) {
            currentIndex = 2;
          }
          return Scaffold(
              body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationRail(
                  selectedIndex: currentIndex,
                  onDestinationSelected: (value) {
                    switch (value) {
                      case 0:
                        delegate.toNamed(HomePage.routeName);
                        break;
                      case 1:
                        delegate.toNamed(ExplorePage.routeName);
                        break;
                      case 2:
                        delegate.toNamed(ProfilePage.routeName);
                        break;
                      default:
                    }
                  },
                  labelType: NavigationRailLabelType.selected,
                  backgroundColor: Get.theme.primaryColor,
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.explore_outlined),
                      selectedIcon: Icon(Icons.explore_rounded),
                      label: Text('Explore'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline_rounded),
                      selectedIcon: Icon(Icons.person_rounded),
                      label: Text('Profile'),
                    ),
                  ],
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  unselectedIconTheme: const IconThemeData(color: Colors.black),
                  selectedLabelTextStyle: const TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: GetRouterOutlet(
                    anchorRoute: DashboardPage.routeName,
                    initialRoute: HomePage.routeName,
                    delegate: Get.nestedKey(DashboardPage.routeName),
                    filterPages: (afterAnchor) {
                      return afterAnchor.take(1);
                    },
                  ),
                ),
              ],
            ),
          ));
        });
  }

  @override
  Widget? phone() {
    return GetRouterOutlet.builder(
      routerDelegate: Get.nestedKey(null),
      builder: (context) {
        final delegate = context.navigation;
        final currentLocation = context.location;
        int currentIndex = 0;
        if (currentLocation.startsWith(ExplorePage.routeName) == true) {
          currentIndex = 1;
        }
        if (currentLocation.startsWith(ProfilePage.routeName) == true) {
          currentIndex = 2;
        }
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                switch (value) {
                  case 0:
                    delegate.toNamed(HomePage.routeName);
                    break;
                  case 1:
                    delegate.toNamed(ExplorePage.routeName);
                    break;
                  case 2:
                    delegate.toNamed(ProfilePage.routeName);
                    break;
                  default:
                }
              },
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  activeIcon: Icon(Icons.explore_rounded),
                  label: ('Explore'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  activeIcon: Icon(Icons.person_rounded),
                  label: ('Profile'),
                ),
              ],
            ),
            body: GetRouterOutlet(
              anchorRoute: DashboardPage.routeName,
              initialRoute: HomePage.routeName,
              // delegate: Get.nestedKey(DashboardPage.routeName),
              // filterPages: (afterAnchor) {
              //   return afterAnchor.take(1);
              // },
            ));
      },
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
