import 'package:emolife/models/orders_model.dart';
import 'package:emolife/view/single/edit_carts_view.dart';
import 'package:emolife/view/widget/drawer_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constans.dart';

List<OrdersModel> models = [];

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
      appBar: AppBar(
        bottom:TabBar(
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
          ]) ,
      ),
      body: Padding(
    padding: const EdgeInsets.only(
    left: 30.0,
    right: 30,
    ),
    child: Column(
        children: [
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
    ));
  }
}

class YetOfOrders extends StatefulWidget {
  var title;

  YetOfOrders({Key? key, this.title}) : super(key: key);

  @override
  State<YetOfOrders> createState() => _YetOfOrdersState();
}

class _YetOfOrdersState extends State<YetOfOrders> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    models = Constans.getFakeModels();
    _scrollController.addListener(() {
      // print(_scrollController.position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return getYetCardItem(ctx, models[index], index);
        },
        itemCount: models.length,
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [];
      },
    );
  }

  Widget getYetCardItem(
      BuildContext context, OrdersModel dataObject, int position) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
            elevation: 15,
            child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 2, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text(
                              _getOrdersTypeTitle(
                                  dataObject.orderInfo!.OrderType),
                              style: const TextStyle(color: Colors.white),
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: _getOrdersTypeColor(
                                    dataObject.orderInfo!.OrderType),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('單據號碼:${dataObject.orderInfo!.IssueNo}'),
                              Text(
                                  "截止日期 ${dataObject.orderInfo!.IssueEndTime}"),
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
                            onTap: () {
                              Get.to(CartView(), arguments: [
                                {"OrderModel": dataObject}
                              ]);
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: const Tooltip(
                                message: "刪除",
                                child: Icon(Icons.delete, size: 25)),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: const Text("確定要刪除購物單嗎"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text("取消")),
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                models.removeAt(position);
                                              });

                                              // widget.refresh();
                                              Get.back();
                                            },
                                            child: const Text("確定")),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                        shrinkWrap: true,
                        itemCount: dataObject.orderData!.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 2),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                    '商品名稱:${dataObject.orderData![index].GoodsName}  數量:${dataObject.orderData![index].GoodsCount}         ${dataObject.orderData![index].GoodsColor}')),
                          );
                        })
              ],
            ),
      ),
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
