import 'package:e_commerce_app/features/auth/forget_password/data/data_sources/firebase_forget_password_data_source.dart';
import 'package:e_commerce_app/features/auth/forget_password/data/repositories/user_forget_repository_impl.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/repositories/user_forget_repository.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/use_cases/user_request_password_use_case.dart';
import 'package:e_commerce_app/features/auth/forget_password/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/sign_in/data/data_sources/firebase_signin_data_source.dart';
import 'package:e_commerce_app/features/auth/sign_in/data/repositories/login_repository_impl.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/repositories/login_repository.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/use_cases/signin_use_case.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/sign_up/data/data_sources/firebase_signup_data_source.dart';
import 'package:e_commerce_app/features/auth/sign_up/data/repositories/register_repository_impl.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/repositories/register_repository.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/use_cases/signup_usecase.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/home/data/data_sources/fire_base_get_category_data_source.dart';
import 'package:e_commerce_app/features/home/data/data_sources/fire_base_get_product_data_source.dart';
import 'package:e_commerce_app/features/home/data/data_sources/fire_base_get_user_data_source.dart';
import 'package:e_commerce_app/features/home/data/repositories/get_categories_repository_impl.dart';
import 'package:e_commerce_app/features/home/data/repositories/get_products_repository_impl.dart';
import 'package:e_commerce_app/features/home/data/repositories/get_user_repository_impl.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_categories_repository.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_products_repository.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_user_repository.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_new_in_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_products_by_category_id_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_Top_Selling_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_user_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/app_bar_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/categories_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/new_in_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/product_top_selling_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/products_by_category_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/search_by_all_product_manager/cubit.dart';
import 'package:e_commerce_app/features/product_details/data/data_sources/fire_base_product_data_source.dart';
import 'package:e_commerce_app/features/product_details/data/repositories/product_repository_impl.dart';
import 'package:e_commerce_app/features/product_details/domain/repositories/product_repository.dart';
import 'package:e_commerce_app/features/product_details/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/features/splash/data/data_sources/firebase_authentication_data_source.dart';
import 'package:e_commerce_app/features/splash/data/repositories/authentication_repository_impl.dart';
import 'package:e_commerce_app/features/splash/domain/repositories/authentication_repository.dart';
import 'package:e_commerce_app/features/splash/domain/use_cases/authentication_use_case.dart';
import 'package:e_commerce_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/product_details/presentation/manager/add_to_cart_manager/cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data source
  sl.registerLazySingleton<FirebaseSignupDataSource>(
      () => FirebaseSignUpDataSourceImpl());

  sl.registerLazySingleton<FirebaseSignInDataSource>(
      () => FirebaseSignInDataSourceImpl());

  sl.registerLazySingleton<FirebaseForgetPasswordDataSource>(
      () => FirebaseForgetPasswordDataSourceImpl());
  sl.registerLazySingleton<FireBaseAuthenticationDataSource>(
      () => FireBaseAuthenticationDataSourceImpl());
  sl.registerLazySingleton<FireBaseGetUserDataSource>(
      () => FireBaseGetUserDataSourceImpl());
  sl.registerLazySingleton<FireBaseGetCategoryDataSource>(
          () => FireBaseGetCategoryDataSourceImpl());

  sl.registerLazySingleton<FireBaseGetProductDataSource>(
          () => FireBaseGetProductDataSourceImpl());
  sl.registerLazySingleton<FireBaseProductDataSource>(
          () => FireBaseProductDataSourceImpl());

  // Repository
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(firebaseSignupDataSource: sl()));
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(firebaseSignInDataSource: sl()));
  sl.registerLazySingleton<UserForgetRepository>(
      () => UserForgetRepositoryImpl(firebaseForgetPasswordDataSource: sl()));
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(fireBaseAuthenticationDataSource: sl()));
  sl.registerLazySingleton<GetUserRepository>(
      () => GetUserRepositoryImpl(fireBaseGetUserDataSource: sl()));
  sl.registerLazySingleton<GetCategoriesRepository>(
          () => GetCategoriesRepositoryImpl(fireBaseGetCategoryDataSource: sl()));
  sl.registerLazySingleton<GetProductsRepository>(
          () => GetProductsRepositoryImpl(fireBaseGetProductDataSource: sl()));
  sl.registerLazySingleton<ProductRepository>(
          () => ProductRepositoryImpl(fireBaseProductDataSource: sl()));

  // Use case
  sl.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(registerRepository: sl()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(loginRepository: sl()));
  sl.registerLazySingleton<UserRequestPasswordUseCase>(
      () => UserRequestPasswordUseCase(userForgetRepository: sl()));
  sl.registerLazySingleton<AuthenticationUseCase>(
      () => AuthenticationUseCase(authenticationRepository: sl()));
  sl.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(getUserRepository: sl()));
  sl.registerLazySingleton<GetCategoriesUseCase>(
          () => GetCategoriesUseCase(getCategoriesRepository: sl()));
  sl.registerLazySingleton<GetTopSellingProductsUseCase>(
          () => GetTopSellingProductsUseCase(getProductsRepository: sl()));
  sl.registerLazySingleton<GetNewInProductsUseCase>(
          () => GetNewInProductsUseCase(getProductsRepository: sl()));
  sl.registerLazySingleton<GetProductsByCategoryIdUseCase>(
          () => GetProductsByCategoryIdUseCase(getProductsRepository: sl()));
  sl.registerLazySingleton<GetAllProductsUseCase>(
          () => GetAllProductsUseCase(getProductsRepository: sl()));
  sl.registerLazySingleton<AddToCartUseCase>(
          () => AddToCartUseCase(productRepository: sl()));
  // Cubit
  sl.registerFactory<SplashCubit>(() => SplashCubit(authenticationUseCases: sl()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(signupUseCase: sl()));
  sl.registerFactory<SignInCubit>(() => SignInCubit(signInUseCase: sl()));
  sl.registerFactory<UserReqPassCubit>(() => UserReqPassCubit(userRequestPasswordUseCase: sl()));
  sl.registerFactory<GetUserCubit>(() => GetUserCubit(getUserUseCase: sl()));
  sl.registerFactory<GetCategoryCubit>(() => GetCategoryCubit(getCategoriesUseCase: sl()));
  sl.registerFactory<GetProductCubit>(() => GetProductCubit(getTopSellingProductsUseCase: sl()));
  sl.registerFactory<GetNewInProductCubit>(() => GetNewInProductCubit(getNewInProductsUseCase: sl()));
  sl.registerFactory<GetProductsByCategoryCubit>(() => GetProductsByCategoryCubit(getProductsByCategoryIdUseCase: sl()));
  sl.registerFactory<GetAllProductsCubit>(() => GetAllProductsCubit(getAllProductsUseCase: sl()));
  sl.registerFactory<AddToCartCubit>(() => AddToCartCubit(addToCartUseCase: sl()));
}
