import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  @override
  void onInit() {
    initDynamicLink();
    super.onInit();
  }

  void initDynamicLink() async {
    if (!kIsWeb) {
      final PendingDynamicLinkData? initialLink =
          await FirebaseDynamicLinks.instance.getInitialLink();
      goToLink(initialLink?.link);

      FirebaseDynamicLinks.instance.onLink.listen((data) async {
        print('Dynamic link --------------------->${data.link}');
        goToLink(data.link);
      }).onError((e) {
        print('Dynamic link Error--------------------->${e.toString()}');
      });
    }
  }

  void goToLink(Uri? link) {
    if (link == null) return;
    final id = link.queryParameters["id"];
    if (id != null) {
      Get.toNamed("${link.path}/$id");
    } else {
      Get.toNamed(link.path);
    }
  }
}
