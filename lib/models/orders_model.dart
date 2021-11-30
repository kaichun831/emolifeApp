import 'package:flutter/material.dart';

/// IssueNo : "ISS20211125001"
/// IssueCreateTime : "2022-01-01"
/// IssueEndTime : "2022-01-03"
/// OrderId : "00001"
/// OrderNo : "ORD202111250001"
/// OrderType : 1

class OrdersModel {
  OrderInfo? orderInfo;
  List<OrderData>? orderData;
    OrdersModel({Key?key,required this.orderInfo,required this.orderData});
}

class OrderInfo{
  String IssueNo="";
  String IssueCreateTime="";
  String IssueEndTime="";
  String OrderId="";
  String OrderNo="";
  int OrderType=0;

  OrderInfo? fromMap(Map<String, dynamic> map) {
    OrderInfo ordersInfoBean = OrderInfo();
    ordersInfoBean.IssueNo = map['IssueNo'];
    ordersInfoBean.IssueCreateTime = map['IssueCreateTime'];
    ordersInfoBean.IssueEndTime = map['IssueEndTime'];
    ordersInfoBean.OrderId = map['OrderId'];
    ordersInfoBean.OrderNo = map['OrderNo'];
    ordersInfoBean.OrderType = map['OrderType'];
    return ordersInfoBean;
  }

  Map toJson() => {
    "IssueNo": IssueNo,
    "IssueCreateTime": IssueCreateTime,
    "IssueEndTime": IssueEndTime,
    "OrderId": OrderId,
    "OrderNo": OrderNo,
    "OrderType": OrderType,
  };
}
class OrderData{
  late String GoodsName;
  late int GoodsCount;
  late String GoodsColor;
  late int GoodsPrice;
  late String GoodsDescription;
  int buyCount = 0;

  OrderData fromMap(Map<String, dynamic> map) {
    OrderData orderDataBean = OrderData();
    orderDataBean.GoodsName = map['GoodsName'];
    orderDataBean.GoodsCount = map['GoodsCount'];
    orderDataBean.GoodsColor = map['GoodsColor'];
    orderDataBean.GoodsPrice =map['GoodsPrice'];
    orderDataBean.GoodsDescription =map['GoodsDescription'];
    return orderDataBean;
  }
  Map toJson() => {
    "GoodsName": GoodsName,
    "GoodsCount": GoodsCount,
    "GoodsColor": GoodsColor,
    "GoodsPrice": GoodsPrice,
    "GoodsDescription": GoodsDescription,
  };
}