import 'package:emolife_purchasing/models/orders_model.dart';
import 'package:emolife_purchasing/view/single/buy_carts_view.dart';
import 'package:emolife_purchasing/view/single/edit_carts_view.dart';
import 'package:emolife_purchasing/view/widget/drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

List<Map<String, dynamic>> fakeData = [
  {
    "OrderInfo": {
      "IssueNo": "ISS20211125001",
      "IssueCreateTime": "2022-01-01",
      "IssueEndTime": "2022-01-04",
      "OrderId": "00001",
      "OrderNo": "ORD202111240001",
      "OrderType": 1,
    },
    "GroupLeaderInfo": {
      "Name": "",
      "Email": "",
      "Score": 4.5,
      "CreateTimes": 3
    },
    "OrderData": [
      {
        "GoodsName": "商品A",
        "GoodsCount": 2,
        "GoodsColor": "黑色",
        "GoodsPrice": 600,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品C",
        "GoodsCount": 2,
        "GoodsColor": "粉色",
        "GoodsPrice": 300,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品E",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品K",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      },
      {
        "GoodsName": "商品D",
        "GoodsCount": 4,
        "GoodsColor": "綠色",
        "GoodsPrice": 100,
        "GoodsDescription":
        "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
      }
    ]
  },
];

List<OrdersModel> models = [];

class FollowMainScreen extends StatefulWidget {
  const FollowMainScreen({Key? key}) : super(key: key);

  @override
  State<FollowMainScreen> createState() => _FollowMainScreenState();
}

class _FollowMainScreenState extends State<FollowMainScreen> {
  var isHasNotification = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    models.clear();
    for (int i = 0; i < fakeData.length; i++) {
      OrderInfo? info = OrderInfo().fromMap(fakeData[i]['OrderInfo']);
      List<OrderData> listData = [];
      for (int x = 0; x < fakeData[i]['OrderData'].length; x++) {
        OrderData data = OrderData().fromMap(fakeData[i]['OrderData'][x]);
        listData.add(data);
      }
      OrdersModel ordersModel =
      OrdersModel(orderInfo: info, orderData: listData);
      models.add(ordersModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const CusDrawerBar(),
        appBar:_appBar() ,
        body: ListView.builder(
            shrinkWrap: true,
            primary: true,
            itemBuilder: (ctx, index) {
              return SizedBox(
                  width: MediaQuery.of(ctx).size.width,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(child: _groupItem(index),onTap:()=>{
                            Get.to(BuyCartsView(),arguments: [models])
                          },);
                        }),
                  ));
            },
            itemCount: 3));
  }
  AppBar _appBar(){
    return AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                Positioned(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.blueGrey,
                        size: 26,
                      )),
                ),
                isHasNotification
                    ? Positioned(
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
  Widget _groupItem(int index) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 210,
              width: double.infinity,
              color: Color.fromRGBO(233,233,245, 1),
              child: Image.network(
                'https://joycat.org/images/photoedit/20170922_153626-800x600.jpg',
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
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child: Text('咸'),
                      radius: 30,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "30件廚房實用組",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      Text(
                        "截止日2021/12/31",
                        style:
                            TextStyle(color: Color.fromRGBO(248, 110, 110, 1)),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
            child: Container(
          color: Color.fromRGBO(248, 110, 110, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Text(
              "倒數31天又5小時",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )),
      ],
    );
  }
}
