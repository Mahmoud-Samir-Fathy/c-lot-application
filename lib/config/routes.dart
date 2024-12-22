import 'package:e_commerce_app/features/auth/forget_password/presentation/pages/forget_password.dart';
import 'package:e_commerce_app/features/auth/forget_password/presentation/pages/return_sign_in.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/pages/enter_password.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/pages/sign_in.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/pages/sign_up.dart';
import 'package:e_commerce_app/features/home/presentation/pages/categories.dart';
import 'package:e_commerce_app/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/product_by_category.dart';
import 'package:e_commerce_app/features/home/presentation/pages/search_page.dart';
import 'package:e_commerce_app/features/splash/presentation/pages/splash_screen.dart';

class AppRoutes {
  static String splashScreen = 'splashScreen';
  static String signIn = 'signIn';
  static String forgetPassword = 'forgetPassword';
  static String signUp = 'signUp';
  static String returnSignIn = 'returnSignIn';
  static String home = 'home';
  static String categories = 'categories';
  static String search = 'search';


  static get routes {
    return {
      AppRoutes.splashScreen: (context) => const SplashScreen(),
      AppRoutes.signIn: (context) => const SignIn(),
      AppRoutes.forgetPassword: (context) => const ForgetPassword(),
      AppRoutes.returnSignIn: (context) => const ReturnSignIn(),
      AppRoutes.signUp: (context) => const SignUp(),
      AppRoutes.home: (context) => const HomePage(),
      AppRoutes.categories: (context) => const Categories(),
      AppRoutes.search: (context) => const SearchPage(),
    };
  }
}
