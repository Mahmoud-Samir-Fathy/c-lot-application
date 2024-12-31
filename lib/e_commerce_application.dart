import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/config/themes.dart';
import 'package:e_commerce_app/features/auth/forget_password/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/get_from_cart_use_case.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/remove_from_cart_use_case.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/checkout/domain/use_cases/order_register_use_case.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_new_in_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_Top_Selling_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_user_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/app_bar_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/categories_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/new_in_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/product_top_selling_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/search_by_all_product_manager/cubit.dart';
import 'package:e_commerce_app/features/splash/domain/use_cases/authentication_use_case.dart';
import 'package:e_commerce_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dependency_injection.dart' as di;
import 'features/home/presentation/pages/search_page.dart';

class ECommerceApplication extends StatelessWidget {
  const ECommerceApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SplashCubit>(
              create: (context) => SplashCubit(
                  authenticationUseCases: di.sl<AuthenticationUseCase>())
                ..appStarted(),
            ),
            BlocProvider<SignUpCubit>(
              create: (context) => di.sl<SignUpCubit>(),
            ),
            BlocProvider<SignInCubit>(
              create: (context) => di.sl<SignInCubit>(),
            ),
            BlocProvider<UserReqPassCubit>(
              create: (context) => di.sl<UserReqPassCubit>(),
            ),
            BlocProvider<GetUserCubit>(
              create: (context) =>
                  GetUserCubit(getUserUseCase: di.sl<GetUserUseCase>())
                    ..getUser(),
            ),
            BlocProvider<GetCategoryCubit>(
              create: (context) => GetCategoryCubit(
                  getCategoriesUseCase: di.sl<GetCategoriesUseCase>())
                ..getCategory(),
            ),
            BlocProvider<GetProductCubit>(
              create: (context) => GetProductCubit(
                  getTopSellingProductsUseCase:
                      di.sl<GetTopSellingProductsUseCase>())
                ..getTopSellingProducts(),
            ),
            BlocProvider<GetNewInProductCubit>(
              create: (context) => GetNewInProductCubit(
                  getNewInProductsUseCase: di.sl<GetNewInProductsUseCase>())
                ..getNewInProducts(),
            ),
            BlocProvider(
              create: (_) => GetAllProductsCubit(
                  getAllProductsUseCase: di.sl<GetAllProductsUseCase>())
                ..getAllProducts(''),
              child: const SearchPage(),
            ),
            BlocProvider<CartCubit>(
              create: (context) => CartCubit(
                removeFromCartUseCase: di.sl<RemoveFromCartUseCase>(),
                  getFromCartUseCase: di.sl<GetFromCartUseCase>()),
            ),
            BlocProvider<OrderRegisterCubit>(
              create: (context) => OrderRegisterCubit(
        orderRegisterUseCase: di.sl<OrderRegisterUseCase>(),)
            ),
          ],
          child: MaterialApp(
            title: 'E-Commerce Application',
            theme: AppTheme.appTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashScreen,
            routes: AppRoutes.routes,
          ),
        );
      },
    );
  }
}
