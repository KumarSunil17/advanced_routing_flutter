import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

///
/// Created by Sunil Kumar
/// On 30-04-2023 04:16 pm

class AppDynamicLinkHelper {
  static const _baseLink = 'https://kumarsunil17.page.link';
  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  static Future<String> generateDynamicLink(String route,
      {String? imageUrl,
      String title = "Advanced Routing",
      String description = "Navigation Example"}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: _baseLink,
      link: Uri.parse('$_baseLink/$route'),
      androidParameters: AndroidParameters(
          packageName: 'com.kumarsunil.advanced_routing_flutter',
          minimumVersion: 1,
          fallbackUrl: Uri.parse('https://google.com')),
      iosParameters: IOSParameters(
          minimumVersion: "1",
          bundleId: 'com.kumarsunil.advanced_routing_flutter',
          ipadBundleId: 'com.kumarsunil.advanced_routing_flutter',
          appStoreId: '1448710117',
          ipadFallbackUrl: Uri.parse('https://google.com'),
          fallbackUrl: Uri.parse('https://google.com')),
      socialMetaTagParameters: SocialMetaTagParameters(
          title: title,
          description: description,
          imageUrl: imageUrl == null ? null : Uri.parse(imageUrl)),
      navigationInfoParameters:
          const NavigationInfoParameters(forcedRedirectEnabled: false),
    );
    final dynamicUrl = await dynamicLinks.buildShortLink(
      parameters,
    );
    print(dynamicUrl.shortUrl.toString());
    // return '$_baseLink/${type.type}?${type.queryName}=$data';
    return dynamicUrl.shortUrl.toString();
  }
}
