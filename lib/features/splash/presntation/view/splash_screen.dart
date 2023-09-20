import 'package:flutter/material.dart';
import 'package:service/core/resources/manager_colors.dart';
import 'package:service/core/resources/manager_font_sizes.dart';
import 'package:service/core/resources/manager_font_weight.dart';
import 'package:service/core/resources/manager_strings.dart';
import 'package:service/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

import '../../../../route/routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
        ()=>
        AppSettingsSharedPreferences().outBoardingViewed
        ?Navigator.pushReplacementNamed(context, Routes.signUp)
            :Navigator.pushReplacementNamed(context, Routes.outBoardingScreen)

    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ManagerStrings.appName,
              style: TextStyle(
                color: ManagerColors.white,
                fontWeight: ManagerFontWeight.regular,
                fontSize: ManagerFontSizes.s40,
                fontFamily: 'Ubuntu'
              ),

            ),

          ],
        ),
      ),

    );
  }
}
