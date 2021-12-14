import 'package:emolife/tools/color_tools.dart';
import 'package:emolife/view/single/drawer_orders_page.dart';
import 'package:emolife/view/single/drawer_user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CusDrawerBar extends StatefulWidget {
  const CusDrawerBar({Key? key}) : super(key: key);

  @override
  State<CusDrawerBar> createState() => _CusDrawerBarState();
}

class _CusDrawerBarState extends State<CusDrawerBar> {
  var selectedPosition = 1;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white.withAlpha(0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 45),
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              children: [
                _topAreaContainer(),
                _listWidgetItem(
                    Icons.account_circle, "個人資訊", const UserInfoScreen()),
                _listWidgetItem(Icons.list_alt, "我的訂單", const OrdersScreen()),
                _listWidgetItem(Icons.groups, "我是團長", null),
                _listWidgetItem(Icons.paid, "加值資訊", null),
                _listWidgetItem(
                    Icons.published_with_changes_rounded, "點數轉移", null),
                _listWidgetItem(Icons.confirmation_number, "我的票券", null),
                _listWidgetItem(Icons.settings, "設定", null)
              ],
            ),
          ),
        ));
  }

  Widget _topAreaContainer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                child: Text("團"),
                radius: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "咸青生活",
                style: TextStyle(fontSize: 28),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("點數餘額"),
              Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                      color: ColorUtil.mainOrangeColor().withAlpha(30),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "\$ 801",
                    style: TextStyle(color: ColorUtil.mainOrangeColor()),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("預扣點數"),
              Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                      color: ColorUtil.mainRedColor().withAlpha(30),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "\$ 801",
                    style: TextStyle(color: ColorUtil.mainRedColor()),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget _listWidgetItem(IconData iconData, String title, Widget? widgetView) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      child: ConstrainedBox(
        constraints:
            const BoxConstraints.tightFor(width: double.infinity, height: 50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
          child: Row(
            children: [
              Icon(
                iconData,
                color: ColorUtil.mainRedColor(),
                size: 28,
              ),
              Expanded(
                  child: Align(
                child: Text(
                  title,
                  style:
                      TextStyle(color: ColorUtil.mainRedColor(), fontSize: 18),
                ),
                alignment: Alignment.center,
              )),
            ],
          ),
          onPressed: () => {
            if (widgetView != null)
              {Get.back(), Navigator.of(context).push(_createRoute(widgetView))}
          },
        ),
      ),
    );
  }

  Route _createRoute(Widget widget) {
    var tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position:
                animation.drive(tween.chain(CurveTween(curve: Curves.ease))),
            child: child,
          );
        });
  }
}
