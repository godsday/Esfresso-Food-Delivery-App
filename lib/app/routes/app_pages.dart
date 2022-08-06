import 'package:get/get.dart';

import '../modules/addLocationScreen/bindings/add_location_screen_binding.dart';
import '../modules/addLocationScreen/views/add_location_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeScreen/bindings/home_screen_binding.dart';
import '../modules/homeScreen/views/home_screen_view.dart';
import '../modules/introductionScreen/bindings/introduction_screen_binding.dart';
import '../modules/introductionScreen/views/introduction_screen_view.dart';
import '../modules/loginScreen/bindings/login_screen_binding.dart';
import '../modules/loginScreen/views/login_screen_view.dart';
import '../modules/onboardScreen/bindings/onboard_screen_binding.dart';
import '../modules/onboardScreen/views/onboard_screen_view.dart';
import '../modules/signupScreen/bindings/signup_screen_binding.dart';
import '../modules/signupScreen/views/signup_screen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SCREEN,
      page: () => SignupScreenView(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD_SCREEN,
      page: () => const OnboardScreenView(),
      binding: OnboardScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_LOCATION_SCREEN,
      page: () => const AddLocationScreenView(),
      binding: AddLocationScreenBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION_SCREEN,
      page: () => const IntroductionScreenView(),
      binding: IntroductionScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () =>  HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
  ];
}
