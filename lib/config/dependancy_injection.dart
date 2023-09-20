import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:service/core/network/api/app_api.dart';
import 'package:service/core/network/api/dio_factory.dart';
import 'package:service/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:service/core/storage/remote/firebase/controllers/fb_notifications.dart';
import 'package:service/features/profile/presntation/controller/profile_controller.dart';
import 'package:service/features/splash/presntation/controller/splash_controller.dart';
import '../core/internet_checker/internet_checker.dart';
import '../features/auth/presentation/conrtoller/auth_controller.dart';
import '../features/home/presntation/controller/home_controller.dart';
import 'package:get_it/get_it.dart';

import '../features/product_details/data/data_source/remote_data_source.dart';
import '../features/product_details/domain/repository/product_dertails_repository.dart';
import '../features/product_details/domain/use_case/product_details_use_case.dart';
import '../features/settings/presentation/controller/locale_notifier_controller.dart';
import '../firebase_options.dart';

final instance = GetIt.instance;
initFirebase ()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
final fbNotifications=FbNotifications();
await fbNotifications.requestNotificationPermissions();
await fbNotifications.initializeForegroundNotificationForAndroid();
FbNotifications.initNotifications();
}
initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  initFirebase();
  await AppSettingsSharedPreferences().initPreferences();

  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImplementation(
        InternetConnectionCheckerPlus(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(
          () => DioFactory(),
    );
  }

  if (!GetIt.I.isRegistered<AppApi>()) {
    Dio dio = await instance<DioFactory>().getDio();
    instance.registerLazySingleton<AppApi>(
          () => AppApi(dio),
    );
  }
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}
initProfile() {
  Get.put<ProfileController>(ProfileController());
}

disposeProfile() {
  Get.delete<ProfileController>();
}

initAuth() {
  disposeSplash();
  Get.put<AuthController>(AuthController());
}

disposeAuth() {
  Get.delete<AuthController>();
}

initHome() {
  disposeSplash();
  disposeAuth();
  initProductDetails();

  Get.put<HomeController>(HomeController());
}

disposeHome() {}

initProductDetails() {
  if (!GetIt.I.isRegistered<ProductDetailsRemoteDataSource>()) {
    instance.registerLazySingleton<ProductDetailsRemoteDataSource>(
          () => ProductDetailsRemoteDataSourceImplementation(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ProductDetailsRepository>()) {
    instance.registerLazySingleton<ProductDetailsRepository>(
          () => ProductDetailsRepositoryImplementation(
        data: instance(),
        networkInfo: instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ProductDetailsUseCaseImplementation>()) {
    instance.registerLazySingleton<ProductDetailsUseCaseImplementation>(
          () => ProductDetailsUseCaseImplementation(
        instance(),
      ),
    );
  }
}

disposeProductDetails() {}
initLocale(){
  Get.put<LocaleNotifierController>(LocaleNotifierController());
}
