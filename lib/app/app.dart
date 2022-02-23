import 'package:mydeardiary/app/ui/helpers/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'main/routes/routes.dart';
import 'ui/theme/app_theme.dart';

// Main App Widget
class MyDearDiaryApp extends StatelessWidget {
  const MyDearDiaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final routeObserver = Get.put<RouteObserver>(
      RouteObserver<PageRoute>(),
    );

    return GetMaterialApp(
      title: 'My dear diary',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      navigatorObservers: [routeObserver],
      initialRoute: '/',
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      getPages: routes,
    );
  }
}
