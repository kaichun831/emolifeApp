import 'package:emolife/models/orders_model.dart';
import 'package:emolife/tools/color_tools.dart';
import 'package:emolife/tools/date_tools.dart';
import 'package:emolife/view/single/edit_carts_page.dart';
import 'package:emolife/view/widget/dash_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  void updateStatus(){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(50),
                    borderRadius: BorderRadius.circular(15)),
                child: TabBar(
                    controller: _tabController,
                    labelColor: ColorUtil.mainRedColor(),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        child: Text("進行中"),
                      ),
                      Tab(
                        child: Text("交貨中"),
                      ),
                      Tab(
                        child: Text("完成訂單"),
                      ),
                    ]),
              ),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: [
                  YetOfOrders(
                    title: 'One', updateStatus:()=>updateStatus(),
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
  Function updateStatus;
  YetOfOrders({Key? key,required void Function() this.updateStatus, this.title}) : super(key: key);

  @override
  State<YetOfOrders> createState() => _YetOfOrdersState();
}

class _YetOfOrdersState extends State<YetOfOrders> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    models = Constans.getFakeModels();
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return getProcessCardItem(models.first.leaderInfo!.OrderInfos[index]);
        },
        itemCount: models.first.leaderInfo!.OrderInfos.length,
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [];
      },
    );
  }

  Widget getProcessCardItem(GroupProcessingBean item) {
    var isAllowCancel =item.IsAllowCancel;
    var isVisible = item.IsVisibleMoney;
    var isAllowChangeAddress = item.IsAllowChangeAddress;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.OrderName,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(item.OrderTypeName,
                      style: TextStyle(
                          color: ColorUtil.mainRedColor(), fontSize: 15))
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ID:${item.OrderNo}",
                    style: TextStyle(
                        fontSize: 10, color: ColorUtil.mainBlueColor()),
                  ),
                  Text("團長-${item.OrderLeader}",
                      style: TextStyle(
                          color: ColorUtil.mainBlueColor(), fontSize: 10)),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
              getScheduleView(item),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  GestureDetector(child: const Icon(
                    Icons.visibility,
                  ),onTap:()=>{
                    item.IsVisibleMoney =!item.IsVisibleMoney,
                    widget.updateStatus(),
                  },),
                  const SizedBox(
                    width: 4,
                  ),
                  isVisible?Text("預繳金額 \$ 100"):Text("預繳金額 \$ ---"),
                  const Spacer(),
                  isAllowChangeAddress?ElevatedButton(
                    onPressed: () {},
                    child: Text("變更交貨方式",style: TextStyle(color:ColorUtil.mainBlueColor()),),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(120, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        primary: ColorUtil.mainBlueColor().withOpacity(0.3),shadowColor: Colors.white.withOpacity(1)),
                  ):OutlinedButton(
                    onPressed:null,
                    child: const Text(
                      "變更交貨方式",
                      style: TextStyle(fontSize: 14),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(120, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        primary: Colors.grey,
                        side: const BorderSide(
                            color: Colors.grey, width: 1)),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  isAllowCancel?OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "申請取消跟團",
                      style: TextStyle(fontSize: 14),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(120, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        primary: ColorUtil.mainRedColor(),
                        side: BorderSide(
                            color: ColorUtil.mainRedColor(), width: 1)),
                  ):OutlinedButton(
                    onPressed:null,
                    child: const Text(
                      "申請取消跟團",
                      style: TextStyle(fontSize: 14),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: const Size(120, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        primary: Colors.grey,
                        side: const BorderSide(
                            color: Colors.grey, width: 1)),
                  ),
                ],
              ),
              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title:Text("訂購商品一覽"),children: [
                Text("我是商品")
              ],)
            ],
          ),

        ),
      ),
    );
  }

  Widget getScheduleView(GroupProcessingBean item) {
    return Row(
      children: [
        Column(
          children: [
            Text("開始跟團"),
            item.OrderStatus == 1
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: ColorUtil.mainBlueColor(),
                      radius: 5,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withAlpha(70),
                      radius: 5,
                    ),
                  ),
            Text(DateTimeUtil.formatMonthAndDay(item.IssueCreateTime)),
          ],
        ),
        Expanded(child: _dashLine()),
        Column(
          children: [
            Text("統計截止"),
            item.OrderStatus == 2
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: ColorUtil.mainBlueColor(),
                      radius: 5,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withAlpha(70),
                      radius: 5,
                    ),
                  ),
            Text(DateTimeUtil.formatMonthAndDay(item.IssueEndTime)),
          ],
        ),
        Expanded(child: _dashLine()),
        Column(
          children: [
            Text("廠商發貨"),
            item.OrderStatus == 3
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: ColorUtil.mainBlueColor(),
                      radius: 5,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withAlpha(70),
                      radius: 5,
                    ),
                  ),
            Text(DateTimeUtil.formatMonthAndDay(item.SendTime)),
          ],
        ),
        Expanded(child: _dashLine()),
        Column(
          children: [
            Text("團長收貨"),
            item.OrderStatus == 4
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: ColorUtil.mainBlueColor(),
                      radius: 5,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withAlpha(70),
                      radius: 5,
                    ),
                  ),
            Text(DateTimeUtil.formatMonthAndDay(item.GotTime)),
          ],
        ),
        Expanded(child: _dashLine()),
        Column(
          children: [
            Text("團長交貨"),
            item.OrderStatus == 5
                ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CircleAvatar(
                backgroundColor: ColorUtil.mainBlueColor(),
                radius: 5,
              ),
            )
                : Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withAlpha(70),
                radius: 5,
              ),
            ),
            Text(DateTimeUtil.formatMonthAndDay(item.OfferTime)),
          ],
        )
      ],
    );
  }

  Widget _dashLine() {
    return Container(
      child: DashLine(
        height: 1.5,
        dashWidth: 8,
      ),
    );
  }

  Widget getYetCardItem(
      BuildContext context, OrdersModel dataObject, int position) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                          _getOrdersTypeTitle(dataObject.orderInfo!.OrderType),
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
                          Text("截止日期 ${dataObject.orderInfo!.IssueEndTime}"),
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
                            message: "刪除", child: Icon(Icons.delete, size: 25)),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
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
