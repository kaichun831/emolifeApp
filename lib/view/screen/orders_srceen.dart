import 'package:emolife_purchasing/view/widget/drawer_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CusDrawerBar(),
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              // color: Colors.grey,
            ),
            child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(
                    child: Text("未截止訂單"),
                  ),
                  Tab(
                    child: Text("進行中訂單"),
                  ),
                  Tab(
                    child: Text("已完成訂單"),
                  )
                ]),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              YetOfOrders(
                title: 'One',
              ),
              IngOfOrders(title: 'Two'),
              DoneOfOrders(title: 'Three')
            ],
          )),
        ],
      ),
    );
  }
}

class YetOfOrders extends StatefulWidget {
  var title;

  YetOfOrders({Key? key, this.title}) : super(key: key);

  @override
  State<YetOfOrders> createState() => _YetOfOrdersState();
}

class _YetOfOrdersState extends State<YetOfOrders> {
  List<Map<String,dynamic>> fakeData = [
    {
      "OrderInfo":{
        "IssueNo":"ISS20211125001",
        "IssueCreateTime":"2022-01-01",
        "IssueEndTime":"2022-01-03",
        "OrderNo":"ORD202111250001",
        "OrderType":1,
      },
      "OrderData":[
        {"GoodsName":"商品A","GoodsCount":5,"GoodsColor":"黑色"},
        {"GoodsName":"商品B","GoodsCount":2,"GoodsColor":"白色"}
      ]
    },
    {
      "OrderInfo":{
        "IssueNo":"ISS20211125002",
        "IssueCreateTime":"2022-01-01",
        "IssueEndTime":"2022-01-04",
        "OrderNo":"ORD202111240001",
        "OrderType":0,
      },
      "OrderData":[
        {"GoodsName":"商品C","GoodsCount":2,"GoodsColor":"黑色"},
        {"GoodsName":"商品C","GoodsCount":2,"GoodsColor":"粉色"},
        {"GoodsName":"商品D","GoodsCount":4,"GoodsColor":"綠色"}
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return getYetCardItem(fakeData[index]);
        },
        itemCount: fakeData.length,
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [];
      },
    );
  }
}

class IngOfOrders extends StatefulWidget {
  var title;

  IngOfOrders({Key? key, this.title}) : super(key: key);

  @override
  State<IngOfOrders> createState() => _IngOfOrdersState();
}

class _IngOfOrdersState extends State<IngOfOrders> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${widget.title}'),
    );
  }
}

class DoneOfOrders extends StatelessWidget {
  var title;

  DoneOfOrders({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$title'),
    );
  }
}

Widget getYetCardItem(Map<String,dynamic> dataObject) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 200,
      child: Card(
          elevation: 15,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                            _getOrdersTypeTitle(dataObject['OrderInfo']['OrderType']),
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: _getOrdersTypeColor(dataObject['OrderInfo']['OrderType']),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text('單據號碼:${dataObject['OrderInfo']['IssueNo']}'),
                            Text("截止日期 ${dataObject['OrderInfo']['IssueEndTime']}"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: const Tooltip(
                            message: "編輯",
                            child: Icon(
                              Icons.edit,
                              size: 25,
                            ),
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          child: const Tooltip(
                              message: "刪除",
                              child: Icon(Icons.delete, size: 25)),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataObject['OrderData'].length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 2),
                          child: ElevatedButton(
                              onPressed: () {},
                              child:  Text('商品名稱:${dataObject['OrderData'][index]['GoodsName']}  數量:${dataObject['OrderData'][index]['GoodsCount']}         ${dataObject['OrderData'][index]['GoodsColor']}')),
                        );
                      }))
            ],
          )),
    ),
  );
}


_getOrdersTypeColor(int type) {
  switch (type) {
    case 0:
      return Colors.green;
    case 1:
      return Colors.pink;
  }
}
_getOrdersTypeTitle(int type) {
  switch (type) {
    case 0:
      return "尬團";
    case 1:
      return "個人";
  }
}
