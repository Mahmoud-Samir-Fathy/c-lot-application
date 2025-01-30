import 'package:e_commerce_app/features/app_bottom_nav/presentation/pages/app_navigation_bar.dart';
import 'package:e_commerce_app/features/auth/forget_password/presentation/pages/forget_password.dart';
import 'package:e_commerce_app/features/auth/forget_password/presentation/pages/return_sign_in.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/pages/sign_in.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/pages/sign_up.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:e_commerce_app/features/checkout/presentation/pages/order_registered_successfully_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/categories.dart';
import 'package:e_commerce_app/features/home/presentation/pages/search_page.dart';
import 'package:e_commerce_app/features/orders/presentation/pages/order_details.dart';
import 'package:e_commerce_app/features/settings/presentation/pages/favourite_page.dart';
import 'package:e_commerce_app/features/settings/presentation/pages/wishlist.dart';
import 'package:e_commerce_app/features/splash/presentation/pages/splash_screen.dart';

class AppRoutes {
  static String splashScreen = 'splashScreen';
  static String signIn = 'signIn';
  static String forgetPassword = 'forgetPassword';
  static String signUp = 'signUp';
  static String returnSignIn = 'returnSignIn';
  static String categories = 'categories';
  static String search = 'search';
  static String orderSuccessful = 'orderSuccessful';
  static String cart = 'cart';
  static String layout = 'layout';
  static String wishList = 'wishList';
  static String favourites = 'favourites';
  static String appNav = 'appNav';
  static String orderDetails = 'orderDetails';


  static get routes {
    return {
      AppRoutes.splashScreen: (context) => const SplashScreen(),
      AppRoutes.signIn: (context) => const SignIn(),
      AppRoutes.forgetPassword: (context) => const ForgetPassword(),
      AppRoutes.returnSignIn: (context) => const ReturnSignIn(),
      AppRoutes.signUp: (context) => const SignUp(),
      AppRoutes.categories: (context) => const Categories(),
      AppRoutes.search: (context) => const SearchPage(),
      AppRoutes.orderSuccessful: (context) => const OrderRegisteredSuccessfullyPage(),
      AppRoutes.cart: (context) => const CartPage(),
      AppRoutes.layout: (context) => const AppNavigationBar(),
      AppRoutes.wishList: (context) => const Wishlist(),
      AppRoutes.favourites: (context) => const FavouritePage(),
      AppRoutes.appNav: (context) => const AppNavigationBar(),
      AppRoutes.orderDetails: (context) => const OrderDetails(),
    };
  }
}
