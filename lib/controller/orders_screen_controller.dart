import 'package:emolife_purchasing/models/orders_model.dart';
import 'package:get/get.dart';

class OrdersScreenController extends GetxController{
  List<Map<String, dynamic>> fakeData = [
    {
      "OrderInfo": {
        "IssueNo": "ISS20211125001",
        "IssueCreateTime": "2022-01-01",
        "IssueEndTime": "2022-01-03",
        "OrderId":"00001",
        "OrderNo": "ORD202111250001",
        "OrderType": 1,
      },
      "OrderData": [
        {"GoodsName": "商品A", "GoodsCount": 5, "GoodsColor": "黑色"},
        {"GoodsName": "商品B", "GoodsCount": 2, "GoodsColor": "白色"}
      ]
    },
    {
      "OrderInfo": {
        "IssueNo": "ISS20211125002",
        "IssueCreateTime": "2022-01-01",
        "IssueEndTime": "2022-01-04",
        "OrderId":"00002",
        "OrderNo": "ORD202111240001",
        "OrderType": 0,
      },
      "OrderData": [
        {"GoodsName": "商品C", "GoodsCount": 2, "GoodsColor": "黑色"},
        {"GoodsName": "商品C", "GoodsCount": 2, "GoodsColor": "粉色"},
        {"GoodsName": "商品D", "GoodsCount": 4, "GoodsColor": "綠色"}
      ]
    }
  ];
  List<OrdersModel> orders= []..obs;
  @override
  void onInit() {
    for(int i=0;i<fakeData.length;i++){
      OrderInfo? info  =OrderInfo().fromMap(fakeData[i]['OrderInfo']);
      List<OrderData> listData = [];
      for(int x =0;x<fakeData[i]['OrderData'].length;x++){
        OrderData data = OrderData().fromMap(fakeData[i]['OrderData'][x]);
        listData.add(data);
      }
      OrdersModel ordersModel=OrdersModel(orderInfo:info, orderData: listData);
      orders.add(ordersModel);
    }
    print("INIT DONE");
    super.onInit();
  }
  void removeItem(int position){
    if(orders.isNotEmpty) {
      orders.removeAt(position);
    }
  }

}