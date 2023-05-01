import 'package:advanced_routing_flutter/firebase_options.dart';
import 'package:advanced_routing_flutter/pages/dashboard/dashboard_page.dart';
import 'package:advanced_routing_flutter/utils/app_pages.dart';
import 'package:advanced_routing_flutter/utils/app_pref_helper.dart';
import 'package:advanced_routing_flutter/utils/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setPathUrlStrategy();
  SharedPreferenceHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Advanced Routing',
      theme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      darkTheme: AppThemes.darkTheme,
      initialRoute: DashboardPage.routeName,
      unknownRoute: AppPages.unknownPage,
      defaultTransition: Transition.fade,
    );
  }
}
