import 'package:emolife_purchasing/view/screen/goods_screen.dart';
import 'package:emolife_purchasing/view/screen/login_screnn.dart';
import 'package:emolife_purchasing/view/screen/orders_srceen.dart';
import 'package:emolife_purchasing/view/single/edit_carts_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Constans.dart';
import 'controller/cart_view_controller.dart';
import 'view/screen/drawer_user_info_screen.dart';
import 'view/screen/follow_main_screen.dart';
import 'view/screen/main_screen.dart';

void main() {
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
    MyApp.appContext = context;
    Constans.instance();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
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
              name: '/edit_cart', page: () => CartView(), binding: EasyBind()),
          GetPage(
              name: '/userInfo',
              page: () => UserInfoScreen(),
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
