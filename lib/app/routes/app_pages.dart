import 'package:get/get.dart';

import '../modules/addLocationScreen/bindings/add_location_screen_binding.dart';
import '../modules/addLocationScreen/views/add_location_screen_view.dart';
import '../modules/cartScreen/bindings/cart_screen_binding.dart';
import '../modules/cartScreen/views/cart_screen_view.dart';
import '../modules/confirm_order/bindings/confirm_order_binding.dart';
import '../modules/confirm_order/views/confirm_order_view.dart';
import '../modules/favouriteScreen/bindings/favourite_screen_binding.dart';
import '../modules/favouriteScreen/views/favourite_screen_view.dart';
import '../modules/foodItemScreen/bindings/food_item_screen_binding.dart';
import '../modules/foodItemScreen/views/food_item_screen_view.dart';
import '../modules/homeScreen/bindings/home_screen_binding.dart';
import '../modules/homeScreen/views/home_screen_view.dart';
import '../modules/introductionScreen/bindings/introduction_screen_binding.dart';
import '../modules/introductionScreen/views/introduction_screen_view.dart';
import '../modules/loginScreen/bindings/login_screen_binding.dart';
import '../modules/loginScreen/views/login_screen_view.dart';
import '../modules/mapScreen/bindings/map_screen_binding.dart';
import '../modules/mapScreen/views/map_screen_view.dart';
import '../modules/onboardScreen/bindings/onboard_screen_binding.dart';
import '../modules/onboardScreen/views/onboard_screen_view.dart';
import '../modules/otp_screen/bindings/otp_screen_binding.dart';
import '../modules/otp_screen/views/otp_screen_view.dart';
import '../modules/promo_screen/bindings/promo_screen_binding.dart';
import '../modules/promo_screen/views/promo_screen_view.dart';
import '../modules/restaurantScreen/bindings/restaurant_screen_binding.dart';
import '../modules/restaurantScreen/views/restaurant_screen_view.dart';
import '../modules/signupScreen/bindings/signup_screen_binding.dart';
import '../modules/signupScreen/views/signup_screen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

// import '../modules/home/bindings/home_binding.dart';
// import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
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
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.FOOD_ITEM_SCREEN,
      page: () => FoodItemScreenView(),
      binding: FoodItemScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_SCREEN,
      page: () => const RestaurantScreenView(),
      binding: RestaurantScreenBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE_SCREEN,
      page: () => const FavouriteScreenView(),
      binding: FavouriteScreenBinding(),
    ),
    GetPage(
      name: _Paths.CART_SCREEN,
      page: () => CartScreenView(),
      binding: CartScreenBinding(),
    ),
    GetPage(
      name: _Paths.MAP_SCREEN,
      page: () => MapScreenView(),
      binding: MapScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROMO_SCREEN,
      page: () => PromoScreenView(),
      binding: PromoScreenBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_ORDER,
      page: () => const ConfirmOrderView(),
      binding: ConfirmOrderBinding(),
    ),
    GetPage(
      name: _Paths.OTP_SCREEN,
      page: () =>  OtpScreenView(),
      binding: OtpScreenBinding(),
    ),
  ];
}
