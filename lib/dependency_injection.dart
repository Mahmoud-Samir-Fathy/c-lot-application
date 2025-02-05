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
import 'package:e_commerce_app/features/cart/data/data_sources/fire_base_get_cart_items_data_source.dart';
import 'package:e_commerce_app/features/cart/data/repositories/get_from_cart_repository_impl.dart';
import 'package:e_commerce_app/features/cart/domain/repositories/get_from_cart_repository.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/get_from_cart_use_case.dart';
import 'package:e_commerce_app/features/checkout/data/repositories/order_registration_repository_impl.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/cubit.dart';
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
import 'package:e_commerce_app/features/orders/data/data_sources/fire_base_orders_data_source.dart';
import 'package:e_commerce_app/features/orders/data/repositories/get_order_repository_impl.dart';
import 'package:e_commerce_app/features/orders/domain/repositories/get_order_repository.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_cancelled_order_use_case.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_delivered_order_use_case.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_on_processing_order_use_case.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_returned_order_use_case.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_shipped_order_use_case.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/settings/data/data_sources/fire_base_settings_data_source.dart';
import 'package:e_commerce_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:e_commerce_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:e_commerce_app/features/settings/domain/use_cases/add_address_use_case.dart';
import 'package:e_commerce_app/features/settings/domain/use_cases/get_address_use_case.dart';
import 'package:e_commerce_app/features/settings/domain/use_cases/get_favourites_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_new_in_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_products_by_category_id_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_Top_Selling_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_user_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/is_favourite_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/set_favourites_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/app_bar_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/categories_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/favourite_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/new_in_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/product_top_selling_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/products_by_category_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/search_by_all_product_manager/cubit.dart';
import 'package:e_commerce_app/features/product_details/data/data_sources/fire_base_product_data_source.dart';
import 'package:e_commerce_app/features/product_details/data/repositories/product_repository_impl.dart';
import 'package:e_commerce_app/features/product_details/domain/repositories/product_repository.dart';
import 'package:e_commerce_app/features/product_details/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/features/settings/domain/use_cases/sign_out_use_case.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/splash/data/data_sources/firebase_authentication_data_source.dart';
import 'package:e_commerce_app/features/splash/data/repositories/authentication_repository_impl.dart';
import 'package:e_commerce_app/features/splash/domain/repositories/authentication_repository.dart';
import 'package:e_commerce_app/features/splash/domain/use_cases/authentication_use_case.dart';
import 'package:e_commerce_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';
import 'features/cart/domain/use_cases/remove_from_cart_use_case.dart';
import 'features/cart/presentation/manager/cubit.dart';
import 'features/checkout/data/data_sources/fire_base_order_registration_data_source.dart';
import 'features/checkout/domain/repositories/order_registration_repository.dart';
import 'features/checkout/domain/use_cases/order_register_use_case.dart';
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
  sl.registerLazySingleton<FireBaseCartItemsDataSource>(
      () => FireBaseCartItemsDataSourceImpl());
  sl.registerLazySingleton<FireBaseOrderRegistrationDataSource>(
      () => FireBaseOrderRegistrationDataSourceImpl());
  sl.registerLazySingleton<FireBaseSettingsDataSource>(
      () => FireBaseSettingsDataSourceImpl());
  sl.registerLazySingleton<FireBaseOrdersDataSource>(
      () => FireBaseOrdersDataSourceImpl());

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
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(fireBaseCartItemsDataSource: sl()));
  sl.registerLazySingleton<OrderRegistrationRepository>(() =>
      OrderRegistrationRepositoryImpl(
          fireBaseOrderRegistrationDataSource: sl()));
  sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(fireBaseSettingsDataSource: sl()));
  sl.registerLazySingleton<GetOrderRepository>(
      () => GetOrderRepositoryImpl(fireBaseOrdersDataSource: sl()));

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
  sl.registerLazySingleton<GetFromCartUseCase>(
      () => GetFromCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton<RemoveFromCartUseCase>(
      () => RemoveFromCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton<OrderRegisterUseCase>(
      () => OrderRegisterUseCase(orderRegistrationRepository: sl()));
  sl.registerLazySingleton<SetFavouritesUseCase>(
      () => SetFavouritesUseCase(getProductsRepository: sl()));
  sl.registerLazySingleton<IsFavouriteUseCase>(
      () => IsFavouriteUseCase(getProductsRepository: sl()));
  sl.registerLazySingleton<GetFavouritesUseCase>(
      () => GetFavouritesUseCase(settingsRepository: sl()));
  sl.registerLazySingleton<GetOnProcessingOrdersUseCase>(
      () => GetOnProcessingOrdersUseCase(repository: sl()));
  sl.registerLazySingleton<GetCancelledOrderUseCase>(
      () => GetCancelledOrderUseCase(repository: sl()));
  sl.registerLazySingleton<GetDeliveredOrderUseCase>(
      () => GetDeliveredOrderUseCase(repository: sl()));
  sl.registerLazySingleton<GetReturnedOrderUseCase>(
      () => GetReturnedOrderUseCase(repository: sl()));
  sl.registerLazySingleton<GetShippedOrderUseCase>(
      () => GetShippedOrderUseCase(repository: sl()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(settingsRepository: sl()));
  sl.registerLazySingleton<AddAddressUseCase>(
      () => AddAddressUseCase(settingsRepository: sl()));
  sl.registerLazySingleton<GetAddressUseCase>(
      () => GetAddressUseCase(settingsRepository: sl()));

  // Cubit
  sl.registerFactory<SplashCubit>(
      () => SplashCubit(authenticationUseCases: sl()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(signupUseCase: sl()));
  sl.registerFactory<SignInCubit>(() => SignInCubit(signInUseCase: sl()));
  sl.registerFactory<UserReqPassCubit>(
      () => UserReqPassCubit(userRequestPasswordUseCase: sl()));
  sl.registerFactory<GetUserCubit>(() => GetUserCubit(getUserUseCase: sl()));
  sl.registerFactory<GetCategoryCubit>(
      () => GetCategoryCubit(getCategoriesUseCase: sl()));
  sl.registerFactory<GetProductCubit>(
      () => GetProductCubit(getTopSellingProductsUseCase: sl()));
  sl.registerFactory<GetNewInProductCubit>(
      () => GetNewInProductCubit(getNewInProductsUseCase: sl()));
  sl.registerFactory<GetProductsByCategoryCubit>(
      () => GetProductsByCategoryCubit(getProductsByCategoryIdUseCase: sl()));
  sl.registerFactory<GetAllProductsCubit>(
      () => GetAllProductsCubit(getAllProductsUseCase: sl()));
  sl.registerFactory<AddToCartCubit>(
      () => AddToCartCubit(addToCartUseCase: sl()));
  sl.registerFactory<CartCubit>(() => CartCubit(
        getFromCartUseCase: sl(),
        removeFromCartUseCase: sl(),
      ));
  sl.registerFactory<OrderRegisterCubit>(
      () => OrderRegisterCubit(orderRegisterUseCase: sl()));
  sl.registerFactory<FavouriteCubit>(
      () => FavouriteCubit(setFavouriteUseCase: sl(), isFavourite: sl()));
  sl.registerFactory<SettingsCubit>(
      () => SettingsCubit(getFavouriteUseCase: sl(),signOutUseCase: sl(),addAddressUseCase: sl(),getAddressUseCase: sl()));
  sl.registerFactory<OrderCubit>(() => OrderCubit(
      getOnProcessingOrdersUseCase: sl(),
      getCancelledOrderUseCase: sl(),
      getDeliveredOrderUseCase: sl(),
      getReturnedOrderUseCase: sl(),
      getShippedOrderUseCase: sl()));
}
