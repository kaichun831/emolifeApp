import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

import 'models/orders_model.dart';

class  Constans {
  static var BASE_URL = "192.168.0.52:99";
  static List<Map<String, dynamic>> fakeData = [
    {
      "OrderInfo": {
        "IssueNo": "ISS20211125001",
        "IssueCreateTime": "2022-01-01",
        "IssueEndTime": "2021-12-03 09:00:00",
        "OrderId": "00001",
        "OrderNo": "ORD202111240001",
        "OrderName": "10件實用廚房小物 揪團一起購",
        "OrderType": 1,
      },
      "GroupLeaderInfo": {
        "Name": "咸青生活",
        "Email": "kaichun831@gmail.com",
        "About":
            "我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長我是團長",
        "FollowCount": 100,
        "Score": 4.5,
        "ImgUrl":
            "https://sw.cool3c.com/article/2018/cc8af05c-30b7-49ce-af6c-10a53100916a.jpg?fit=max&w=1400&q=80",
        "CreateTimes": 3,
        "GroupProcessing": [
          {
            "IssueNo": "ISS20211125005",
            "IssueCreateTime": "2022-01-01",
            "IssueEndTime": "2022-01-04",
            "SendTime":"2020-01-05",
            "GotTime":"2020-01-08",
            "OfferTime":"2020-01-10",
            "OrderId": "00001",
            "OrderNo": "ORD202111240001",
            "OrderLeader":"咸青生活",
            "OrderStatus":1,
            "OrderName": "20件實用廚房小物 揪團一起購",
            "OrderType": 1,
            "OrderTypeName":"跟團",
            "IsAllowChangeAddress":true,
            "IsAllowCancel":true,
          },
          {
            "IssueNo": "ISS20211125005",
            "IssueCreateTime": "2022-01-03",
            "IssueEndTime": "2022-01-08",
            "SendTime":"2020-01-05",
            "GotTime":"2020-01-08",
            "OfferTime":"2020-01-10",
            "OrderId": "00001",
            "OrderNo": "ORD202111240002",
            "OrderLeader":"咸青生活",
            "OrderStatus":4,
            "OrderName": "10件實用廚房小物 揪團一起購",
            "OrderType": 1,
            "OrderTypeName":"跟團",
            "IsAllowChangeAddress":false,
            "IsAllowCancel":false,
          },
        ]
      },
      "OrderData": [
        {
          "GoodsName": "商品A",
          "GoodsCount": 2,
          "GoodsColor": "黑色",
          "GoodsPrice": 600,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/%E6%98%9F%E5%B7%B4%E5%85%8Bnew-core%E7%B3%BB%E5%88%97%E6%96%B0%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1595242460.jpg?crop=0.668xw:1.00xh;0.0408xw,0&resize=640:*",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品B",
          "GoodsCount": 4,
          "GoodsColor": "藍色",
          "GoodsPrice": 200,
          "GoodUrl":
              "https://e.ecimg.tw/items/DGAF9AA900BVL3H/i010001_1634261646.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        },
        {
          "GoodsName": "商品C",
          "GoodsCount": 2,
          "GoodsColor": "藍色",
          "GoodsPrice": 500,
          "GoodUrl":
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/herschel-starbucks-2021%E8%81%AF%E5%90%8D%E5%95%86%E5%93%81%E6%83%85%E5%A2%83%E5%9C%96-1-1618469231.jpg",
          "GoodsDescription":
              "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述"
        }
      ]
    },

  ];

  static List<OrdersModel> getFakeModels() {
    List<OrdersModel> _models = [];
    for (int i = 0; i < fakeData.length; i++) {
      OrderInfo? info = OrderInfo().fromMap(fakeData[i]['OrderInfo']);
      GroupLeaderInfo? leaderInfo =
          GroupLeaderInfo().fromMap(fakeData[i]['GroupLeaderInfo']);
      List<OrderData> listData = [];
      for (int x = 0; x < fakeData[i]['OrderData'].length; x++) {
        OrderData data = OrderData().fromMap(fakeData[i]['OrderData'][x]);
        listData.add(data);
      }
      OrdersModel ordersModel = OrdersModel(
          orderInfo: info, leaderInfo: leaderInfo, orderData: listData);
      _models.add(ordersModel);
    }
    return _models;
  }
}
