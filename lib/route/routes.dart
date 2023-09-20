
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service/core/resources/manager_strings.dart';
import 'package:service/features/auth/presentation/conrtoller/auth_controller.dart';
import 'package:service/features/auth/presentation/view/sign_in.dart';
import 'package:service/features/auth/presentation/view/sign_up.dart';
import 'package:service/features/home/presntation/view/home_view.dart';
import 'package:service/features/product_details/presntation/view/item_details_view.dart';
import 'package:service/features/profile/presntation/view/proflie_view.dart';

import '../config/dependancy_injection.dart';
import '../features/out_boarding/presentation/view/out_boarding_screen.dart';
import '../features/settings/presentation/view/screen/locale_view.dart';
import '../features/splash/presntation/view/splash_screen.dart';

class Routes {
  static const String splashScreen = '/splash_screen';
  static const String outBoardingScreen = '/out_boarding_screen';
  static const String authenticationView = '/authenticationView';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String homeView = '/HomeView';
  static const String itemDetails = '/ItemDetails';
  static const String profileView= '/ProfileView';
  static const String language = '/language';
}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashScreen :
        return MaterialPageRoute(builder: (_)=>SplashScreen());
      case Routes.outBoardingScreen :
        return MaterialPageRoute(builder: (_)=>OutBoardingScreen());
      case Routes.signIn :
        initAuth();
        return MaterialPageRoute(builder: (_)=>SignIn());
      case Routes.signUp :
        initAuth();
        return MaterialPageRoute(builder: (_)=>SignUp());
      case Routes.homeView :
        initHome();
        return MaterialPageRoute(builder: (_)=>HomeView());
      case Routes.itemDetails :
        initProductDetails();
        return MaterialPageRoute(builder: (_)=>ItemDetails());

      case Routes.profileView :
        initProfile();
        return MaterialPageRoute(builder: (_)=>ProfileView());
      case Routes.language:
        initLocale();
        return MaterialPageRoute(builder: (_) => const LocaleView());

      default:
        return MaterialPageRoute(builder: (_)=>Undefined());

    }
  }


  }
  class Undefined extends StatelessWidget {
    const Undefined({super.key});

    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        body: Text("gfd"),
      );
    }
  }




