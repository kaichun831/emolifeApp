import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CusDrawerBar extends StatefulWidget {
  const CusDrawerBar({Key? key}) : super(key: key);

  @override
  State<CusDrawerBar> createState() => _CusDrawerBarState();
}

class _CusDrawerBarState extends State<CusDrawerBar> {
  var selectedPosition = 1;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                    top:10,
                    left: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                  CircleAvatar(child: Text("團"),radius: 30,),
                      Text("KG",style: TextStyle(fontSize: 18),)
                ],)),
                Positioned(
                    bottom: 0,
                    right: 3,
                    child: ElevatedButton(onPressed: () {  },
                child: const Text("快速帳戶"),))
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 1),
          child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: double.infinity, height: 50),
              child: ElevatedButton(
                child: const Text('最新公告'),
                onPressed: () {},
              ),),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: double.infinity, height: 50),
              child: ElevatedButton(
                child: const Text('首頁'),
                onPressed: () {
                  Get.toNamed('/');
                },
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: double.infinity, height: 50),
              child: ElevatedButton(
                child: const Text('我的訂單'),
                onPressed: () {
                  Get.toNamed('/orders');
                },
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: double.infinity, height: 50),
              child: ElevatedButton(
                child: const Text('我是團長'),
                onPressed: () {},
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: double.infinity, height: 50),
              child: ElevatedButton(
                child: const Text('個人資訊'),
                onPressed: () {
                  Get.toNamed('/userInfo');
                },
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: double.infinity, height: 50),
              child: ElevatedButton(
                child: const Text('加值資訊'),
                onPressed: () {},
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: double.infinity, height: 50),
              child: ElevatedButton(
                child: const Text('點數轉移'),
                onPressed: () {},
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: double.infinity, height: 50),
              child: ElevatedButton(
                child: const Text('我的票券'),
                onPressed: () {},
              ),),
          ),
        ],
      ),
    ));
  }
  bool _checkPosition(int position){
    if(selectedPosition==position){
      return true;
    }else{
      return false;
    }
  }
}
