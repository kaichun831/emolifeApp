import 'package:emolife_purchasing/view/screen/goods_screen.dart';
import 'package:emolife_purchasing/view/screen/orders_srceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Constans.dart';
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
        ),
        initialRoute: '/orders',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
              name: '/',
              page: () => const MainScreen(),
              binding: EasyBind()),
          GetPage(
              name: '/buy',
              page: () => const BuyView(),
              binding: EasyBind()),
          GetPage(
              name: '/orders',
              page: () => const OrdersScreen(),
              binding: EasyBind()),
        ]);
  }
}

class EasyBind extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<GPSController>(() => GPSController());
  }
}
