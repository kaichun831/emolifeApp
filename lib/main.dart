import 'package:emolife/view/screen/goods_screen.dart';
import 'package:emolife/view/screen/login_screen.dart';
import 'package:emolife/view/single/drawer_orders_page.dart';
import 'package:emolife/view/single/edit_carts_page.dart';
import 'package:emolife/view/single/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controller/cart_view_controller.dart';
import 'view/screen/follow_main_screen.dart';
import 'view/screen/main_screen.dart';
import 'view/single/drawer_user_info_screen.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static late BuildContext appContext;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.white.withAlpha(0),
            /* set Status bar color in Android devices. */

            statusBarIconBrightness: Brightness.dark,
            /* set Status bar icons color in Android devices.*/

            statusBarBrightness:
                Brightness.dark) /* set Status bar icon color in iOS. */
        );
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.white.withAlpha(0),
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black)),
            platform: TargetPlatform.iOS,
            primarySwatch: Colors.blue,
            primaryColor: Colors.white,
            fontFamily: "SweiGothicCJKtc"),
        initialRoute: '/signIn',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
              name: '/', page: () => const MainScreen(), binding: EasyBind()),
          GetPage(
              name: '/follow',
              page: () => const FollowMainScreen(),
              binding: EasyBind()),
          GetPage(
              name: '/signIn',
              page: () => const LoginScreen(),
              binding: EasyBind()),
          GetPage(
              name: '/buy', page: () => const BuyView(), binding: EasyBind()),
          GetPage(
              name: '/orders',
              page: () => const OrdersScreen(),
              binding: EasyBind()),
          GetPage(
              name: '/edit_cart', page: () => const CartView(), binding: EasyBind()),
          GetPage(
              name: '/userInfo',
              page: () => const UserInfoScreen(),
              binding: EasyBind()),
          GetPage(
              name: '/register',
              page: () =>  RegisterPage(),
              binding: EasyBind())
        ]);
  }
}

class EasyBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartViewController>(() => CartViewController());
  }
}
