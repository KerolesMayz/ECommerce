import 'package:ecommerce_app/core/resources/shared_prefs_keys.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/widget/my_bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  String initialRoute;
  await SharedPrefs.init();
  var token = SharedPrefs.getData(key: SharedPrefsKeys.token);
  token==null?initialRoute=Routes.signInRoute:initialRoute=Routes.mainRoute;
  configureDependencies();
  runApp(MainApp(initialRoute: initialRoute,));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key,required this.initialRoute});
  final String initialRoute;

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
        initialRoute: initialRoute,
      ),
    );
  }
}
