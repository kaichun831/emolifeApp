import 'package:emolife_purchasing/controller/cart_view_controller.dart';
import 'package:emolife_purchasing/models/orders_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constans.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final _controller = CartViewController();
  var user = Constans.User;
  var _total = 0;

  @override
  void initState() {
    super.initState();
    getTotal(_controller.getOrderData()!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            getTitleWidget(_controller.getOrderInfo()),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Dismissible(
                      background:Container(color: Colors.blue,child:
                          const Align(alignment:Alignment.centerLeft, child: Icon(Icons.arrow_forward_ios_sharp),)
                      ),
                      secondaryBackground:Container(color: Colors.red,child:
                          const Align(alignment:Alignment.centerRight, child:Icon(Icons.delete),)
                      ) ,
                      onDismissed: (DismissDirection  direction){
                        if(direction ==DismissDirection.endToStart){
                          _controller.removeOrderDataByPosition(index);
                        }else{

                        }
                        setState(() {

                        });
                      },
                      key: UniqueKey(),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(3)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      _controller
                                          .getOrderData()![index]
                                          .GoodsName,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      _controller
                                          .getOrderData()![index]
                                          .GoodsColor,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ),
                            Expanded(
                                child: Text(
                                    "x ${_controller.getOrderData()![index].GoodsCount}"))
                          ],
                        ),
                      ));
                },
                separatorBuilder: (ctx, index) {
                  return const Divider(
                    height: 1,
                    thickness: 1,
                  );
                },
                itemCount: _controller.getOrderData()!.length),
          ],
        ),
      ),
    );
  }

  Widget getTitleWidget(OrderInfo? info) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Text(
              _getOrdersTypeTitle(info!.OrderType),
              style: const TextStyle(color: Colors.white),
            ),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: _getOrdersTypeColor(info.OrderType),
                borderRadius: BorderRadius.circular(5)),
          ),
          const Text('單據資訊\t'),
          Text(
            info.OrderNo,
            style: const TextStyle(fontSize: 10),
          )
        ],
      ),
      expandedAlignment: Alignment.centerLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, bottom: 5),
          child: Text("截止時間 :${info.IssueEndTime}"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, bottom: 5),
          child: Text("總點數 \$\:${_total}"),
        )
      ],
    );
  }

  void getTotal(List<OrderData> data) {
    _total = 0;
    for (int i = 0; i < data.length; i++) {
      _total += data[i].GoodsPrice * data[i].GoodsCount;
    }
  }

  void getCartItemView() {}

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
}
