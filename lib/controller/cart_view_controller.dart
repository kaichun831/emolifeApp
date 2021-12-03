import 'package:emolife/models/orders_model.dart';
import 'package:get/get.dart';

class CartViewController extends GetxController{
  List<Map<String,OrdersModel>> argumentData = Get.arguments;

  OrderInfo? getOrderInfo(){
    return argumentData.first['OrderModel']!.orderInfo;
  }
  List<OrderData>? getOrderData(){
    return argumentData.first['OrderModel']!.orderData;
  }
  void removeOrderDataByPosition(int position){
    argumentData.first['OrderModel']!.orderData!.removeAt(position);
  }
}