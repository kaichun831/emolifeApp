import 'package:emolife_purchasing/models/orders_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

List<OrdersModel> _models = [];

class BuyCartsView extends StatefulWidget {
  const BuyCartsView({Key? key}) : super(key: key);

  @override
  State<BuyCartsView> createState() => _BuyCartsViewState();
}

class _BuyCartsViewState extends State<BuyCartsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  int selectedPosition = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _models.clear();
    for (int i = 0; i < fakeData.length; i++) {
      OrderInfo? info = OrderInfo().fromMap(fakeData[i]['OrderInfo']);
      List<OrderData> listData = [];
      for (int x = 0; x < fakeData[i]['OrderData'].length; x++) {
        OrderData data = OrderData().fromMap(fakeData[i]['OrderData'][x]);
        listData.add(data);
      }
      OrdersModel ordersModel =
          OrdersModel(orderInfo: info, orderData: listData);
      _models.add(ordersModel);
    }
    _pageController.addListener(() {
      setState(() {
        selectedPosition = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  color: Colors.grey.withAlpha(50),
                  height: MediaQuery.of(context).size.height / 2 / 1.2,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: _models.first.orderData!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Image.network(
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
                        );
                      })),
              Positioned(
                  left: 10,
                  top: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, shape: const StadiumBorder()),
                      child: const Text(
                        "< Go Back",
                        style:
                            TextStyle(color: Color.fromRGBO(249, 128, 128, 1)),
                      ),
                      onPressed: () {
                        Get.back();
                      })),
              Positioned(
                  right: 10,
                  top: 60,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_control_rounded,
                          color: Color.fromRGBO(249, 128, 128, 1),
                        ),
                        onPressed: () {},
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _models.first.orderData![selectedPosition].GoodsName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ID:${_models.first.orderInfo!.OrderNo}",
                      style: const TextStyle(
                          color: Color.fromRGBO(138, 143, 241, 1)),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite,
                            size: 18, color: Color.fromRGBO(249, 128, 128, 1)))
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            offset: Offset(1, 1))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.access_time_rounded,
                          color: Color.fromRGBO(249, 128, 128, 1),
                        ),
                        Text(
                          '截止日2021/11/31 倒數: 20天11小時35分',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(249, 128, 128, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey.withAlpha(10),
                  child: TabBar(
                      controller: _tabController,
                      labelColor: const Color.fromRGBO(249, 128, 128, 1),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(
                          child: Text("全部商品"),
                        ),
                        Tab(
                          child: Text("單品詳情"),
                        ),
                        Tab(
                          child: Text("團長簡介"),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 580,
                  width: MediaQuery.of(context).size.width,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _groupAllDetailView(),
                      _singleGoodInfo(),
                      Text("Test")
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _groupAllDetailView() {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scrollbar(
            child: ListView.builder(
                itemCount: _models.first.orderData!.length,
                itemBuilder: (ctx, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 80,
                                height: 80,
                                color: Colors.blueGrey.withAlpha(70),
                                child: GestureDetector(
                                  child: Image.network(
                                    'https://joycat.org/images/photoedit/20170922_153626-800x600.jpg',
                                    loadingBuilder:
                                        (ctx, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                          child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ));
                                    },
                                  ),
                                  onTap: () {
                                    _pageController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linearToEaseOut,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _models.first.orderData![index].GoodsName,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "規格:${_models.first.orderData![index].GoodsColor}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_models.first.orderData![index].buyCount >
                                    0) {
                                  _models.first.orderData![index].buyCount--;
                                }
                              });
                            },
                            child: Icon(
                              Icons.remove_circle_outline_outlined,
                              color:
                                  _models.first.orderData![index].buyCount > 0
                                      ? const Color.fromRGBO(249, 128, 128, 1)
                                      : Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${_models.first.orderData![index].buyCount}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _models.first.orderData![index].buyCount++;
                              });
                            },
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              color:
                                  _models.first.orderData![index].buyCount > 0
                                      ? const Color.fromRGBO(249, 128, 128, 1)
                                      : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                })));
  }

  Widget _singleGoodInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "已參團數 10",
              style: TextStyle(
                  color: Color.fromRGBO(249, 128, 128, 1), fontSize: 16),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_models.first.orderData![selectedPosition].buyCount >
                          0) {
                        _models.first.orderData![selectedPosition].buyCount--;
                      }
                    });
                  },
                  child: Icon(
                    Icons.remove_circle_outline_outlined,
                    color:
                        _models.first.orderData![selectedPosition].buyCount > 0
                            ? const Color.fromRGBO(249, 128, 128, 1)
                            : Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${_models.first.orderData![selectedPosition].buyCount}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _models.first.orderData![selectedPosition].buyCount++;
                    });
                  },
                  child: Icon(
                    Icons.add_circle_outline_rounded,
                    color:
                        _models.first.orderData![selectedPosition].buyCount > 0
                            ? const Color.fromRGBO(249, 128, 128, 1)
                            : Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
        Text(
          _models.first.orderData![selectedPosition].GoodsName,
          style: const TextStyle(color: Colors.black, fontSize: 30),
        ),
        Text(
          "規格:${_models.first.orderData![selectedPosition].GoodsColor}",
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        Text(
          _models.first.orderData![selectedPosition].GoodsDescription,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }
}
