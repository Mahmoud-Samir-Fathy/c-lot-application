import 'package:e_commerce_app/core/observers/bloc_observer.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/e_commerce_application.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await init();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ECommerceApplication());
}
