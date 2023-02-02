import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getinfinitybox/route_generator.dart';
import 'package:getinfinitybox/screens/login_screen.dart';
import 'package:getinfinitybox/screens/product_list_screen.dart';
import 'package:getinfinitybox/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await GetStorage.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'GetInfinityBox',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            primarySwatch: Colors.blue,
            fontFamily: 'DMSans',
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          home: child,
          onGenerateRoute: RouteGenerator.generateRoute,
          builder: EasyLoading.init(),
        );
      },
      child: GetStorage().read('username') != null
          ? const ProductsListScreen()
          : LoginScreen(),
    );
  }
}
