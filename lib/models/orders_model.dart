import 'package:flutter/material.dart';

class OrdersModel {
  OrderInfo? orderInfo;
  GroupLeaderInfo? leaderInfo;
  List<OrderData>? orderData;
  OrdersModel({Key?key,required this.orderInfo,required this.leaderInfo,required this.orderData,});
}

class OrderInfo{
  String IssueNo="";
  String IssueCreateTime="";
  String IssueEndTime="";
  String OrderId="";
  String OrderNo="";
  String OrderName ="";
  int OrderType=0;

  OrderInfo? fromMap(Map<String, dynamic> map) {
    OrderInfo ordersInfoBean = OrderInfo();
    ordersInfoBean.IssueNo = map['IssueNo'];
    ordersInfoBean.IssueCreateTime = map['IssueCreateTime'];
    ordersInfoBean.IssueEndTime = map['IssueEndTime'];
    ordersInfoBean.OrderId = map['OrderId'];
    ordersInfoBean.OrderNo = map['OrderNo'];
    ordersInfoBean.OrderType = map['OrderType'];
    ordersInfoBean.OrderName = map['OrderName'];
    return ordersInfoBean;
  }

  Map toJson() => {
    "IssueNo": IssueNo,
    "IssueCreateTime": IssueCreateTime,
    "IssueEndTime": IssueEndTime,
    "OrderId": OrderId,
    "OrderNo": OrderNo,
    "OrderName":OrderName,
    "OrderType": OrderType,
  };
}
class OrderData{
  late String GoodsName;
  late int GoodsCount;
  late String GoodsColor;
  late int GoodsPrice;
  late String GoodsDescription;
  late String GoodUrl;
  int buyCount = 0;

  OrderData fromMap(Map<String, dynamic> map) {
    OrderData orderDataBean = OrderData();
    orderDataBean.GoodsName = map['GoodsName'];
    orderDataBean.GoodsCount = map['GoodsCount'];
    orderDataBean.GoodsColor = map['GoodsColor'];
    orderDataBean.GoodsPrice =map['GoodsPrice'];
    orderDataBean.GoodsDescription =map['GoodsDescription'];
    orderDataBean.GoodUrl = map['GoodUrl'];
    return orderDataBean;
  }
  Map toJson() => {
    "GoodsName": GoodsName,
    "GoodsCount": GoodsCount,
    "GoodsColor": GoodsColor,
    "GoodsPrice": GoodsPrice,
    "GoodsDescription": GoodsDescription,
    "GoodUrl":GoodUrl
  };
}

class GroupLeaderInfo {
  String Name="";
  String Email="";
  String About="";
  int FollowCount=0;
  double Score=0;
  int CreateTimes=0;
  String ImgUrl ="";
  List<GroupProcessingBean> OrderInfos=[];
  GroupLeaderInfo fromMap(Map<String, dynamic> map) {
    GroupLeaderInfo gGroupLeaderInfoBean = GroupLeaderInfo();
    gGroupLeaderInfoBean.Name = map['Name'];
    gGroupLeaderInfoBean.Email = map['Email'];
    gGroupLeaderInfoBean.About = map['About'];
    gGroupLeaderInfoBean.FollowCount = map['FollowCount'];
    gGroupLeaderInfoBean.Score = map['Score'];
    gGroupLeaderInfoBean.CreateTimes = map['CreateTimes'];
    gGroupLeaderInfoBean.ImgUrl=map['ImgUrl'];
    gGroupLeaderInfoBean.OrderInfos = [...(map['GroupProcessing'] as List).map((o) => GroupProcessingBean.fromMap(o))];
    return gGroupLeaderInfoBean;
  }
  Map toJson() => {
    "Name": Name,
    "Email": Email,
    "About": About,
    "FollowCount": FollowCount,
    "Score": Score,
    "CreateTimes": CreateTimes,
    "ImgUrl":ImgUrl,
    "GroupProcessing": OrderInfos,
  };
}
class GroupProcessingBean {
  String IssueNo="";
  String IssueCreateTime="";
  String IssueEndTime="";
  String OrderId="";
  String OrderNo="";
  String OrderName="";
  int OrderType=0;

  static GroupProcessingBean fromMap(Map<String, dynamic> map) {
    GroupProcessingBean groupProcessingBean = GroupProcessingBean();
    groupProcessingBean.IssueNo = map['IssueNo'];
    groupProcessingBean.IssueCreateTime = map['IssueCreateTime'];
    groupProcessingBean.IssueEndTime = map['IssueEndTime'];
    groupProcessingBean.OrderId = map['OrderId'];
    groupProcessingBean.OrderNo = map['OrderNo'];
    groupProcessingBean.OrderName = map['OrderName'];
    groupProcessingBean.OrderType = map['OrderType'];
    return groupProcessingBean;
  }

  Map toJson() => {
    "IssueNo": IssueNo,
    "IssueCreateTime": IssueCreateTime,
    "IssueEndTime": IssueEndTime,
    "OrderId": OrderId,
    "OrderNo": OrderNo,
    "OrderName": OrderName,
    "OrderType": OrderType,
  };
}






