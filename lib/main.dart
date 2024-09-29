import 'package:e_commerce/config/routes_manager/route_generator.dart';
import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/utils/observer.dart';
import 'package:e_commerce/features/bottom_nav_bar/view_model/bottom_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  String? token = CacheHelper.getData<String>("token");
  print('Route $token');
  runApp(BlocProvider(
    create: (context) => BottomBarCubit(),
    child: MainApp(
      // loggedIn: token == null ? false : true,
    ),
  ));
}

class MainApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.bottomBar,
          ),
    );
  }
}
