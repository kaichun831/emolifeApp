import 'dart:async';

import 'package:emolife/models/orders_model.dart';
import 'package:emolife/tools/color_tools.dart';
import 'package:emolife/tools/date_tools.dart';
import 'package:emolife/view/single/buy_carts_view.dart';
import 'package:emolife/view/widget/drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../constans.dart';

List<OrdersModel> models = [];

class FollowMainScreen extends StatefulWidget {
  const FollowMainScreen({Key? key}) : super(key: key);

  @override
  State<FollowMainScreen> createState() => _FollowMainScreenState();
}

class _FollowMainScreenState extends State<FollowMainScreen>{
  var isHasNotification = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var fakeData = Constans.fakeData;
  late Timer _timer ;
  @override
  void initState() {
    super.initState();
    models = Constans.getFakeModels();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        for (var element in models) {
          var myDate = DateTime.now().difference(DateTime.parse(element.orderInfo!.IssueEndTime));
          element.orderInfo!.reciprocalTime =DateTimeUtil.reciprocalTime(myDate.inSeconds);
        }
      });
    });
  }

  AppBar _appBar() {
    return AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                Positioned(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.blueGrey,
                        size: 26,
                      )),
                ),
                isHasNotification
                    ? const Positioned(
                  child: CircleAvatar(
                    child: Text(''),
                    backgroundColor: Colors.red,
                    radius: 5,
                  ),
                  right: 8,
                  top: 8,
                )
                    : SizedBox()
              ],
            ),
          )
        ],
        leading: IconButton(
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: const Text("跟團活動", style: TextStyle(color: Colors.black)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const CusDrawerBar(),
        appBar: _appBar(),
        body: ListView.builder(
            shrinkWrap: true,
            primary: true,
            itemBuilder: (ctx, index) {
              return SizedBox(
                  width: MediaQuery.of(ctx).size.width,
                  height: MediaQuery.of(ctx).size.height/2,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: _groupItem(models[index]),
                        onTap: () => {
                          Get.to(BuyCartsView(orderModel: models[index],))
                        },
                      )));
            },
            itemCount: models.length));
  }

  Widget _groupItem(OrdersModel model) {
    return Stack(children: [
      Column(
        children: [
          Expanded(child: PageView.builder(
              itemCount: model.orderData!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Container(
                  height: 210,
                  width: double.infinity,
                  color: const Color.fromRGBO(233, 233, 245, 1),
                  child: Image.network(
                    model.orderData![index].GoodUrl,
                    loadingBuilder: (ctx, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                          child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ));
                    },
                    fit: BoxFit.cover,
                  ),
                );
              }),),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.network(
                      model.leaderInfo!.ImgUrl,
                      height:40,
                      width:40,
                      fit:BoxFit.cover,
                      loadingBuilder: (ctx, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ));
                      },
                    ),
                  )
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.orderInfo!.OrderName,
                      style: const TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "截止日:${model.orderInfo!.IssueEndTime}",
                      style: TextStyle(color: ColorUtil.mainRedColor()),
                    )
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                )
              ],
            ),
        ],
      ),
      Positioned(
          top:0,
          left: 0,
          child:
      Container(
        color: ColorUtil.mainRedColor(),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Text(
            model.orderInfo!.reciprocalTime,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ))
    ]);
  }


}
