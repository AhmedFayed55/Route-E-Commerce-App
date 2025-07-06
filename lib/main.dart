import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/config/routes_manager/route_generator.dart';
import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/local_ds/prefs_helper.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await PrefHelper.init();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: PrefHelper.getData(key: AppConstants.token) != null
            ? Routes.mainRoute
            : Routes.signInRoute,
    )
    );
  }
}

