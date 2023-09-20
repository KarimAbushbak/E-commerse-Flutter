import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:service/config/dependancy_injection.dart';
import 'package:service/config/locale/locale_settings.dart';
import 'package:service/core/constants.dart';
import 'package:service/core/resources/manager_assets.dart';
import 'package:service/features/out_boarding/presentation/view/out_boarding_screen.dart';
import 'package:service/features/splash/presntation/view/splash_screen.dart';

import 'route/routes.dart';

main() async {
  await initModule();
  runApp(
    EasyLocalization(
        supportedLocales: LocaleSettings().locales,
        path: ManagerPaths.translationsPath,
        startLocale: localeSettings.defaultLocale,
        fallbackLocale: localeSettings.defaultLocale,
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        designSize:
            Size(Constants.designDeviceWidth, Constants.designDeviceHeight),
        builder: (context, child) {
          return GetMaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            initialRoute: Routes.splashScreen,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        });
  }
}
