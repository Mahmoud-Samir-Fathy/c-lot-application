import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/splash/domain/use_cases/authentication_use_case.dart';
import 'package:e_commerce_app/features/splash/presentation/cubit/splash_states.dart';

class SplashCubit extends Cubit<SplashStates>{
  final AuthenticationUseCase authenticationUseCases;
  SplashCubit({required this.authenticationUseCases}):super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    final isAuthenticated = await authenticationUseCases.authenticationRepository.authentication();
    if (isAuthenticated) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

}