import 'package:emolife/view/widget/drawer_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'goods_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CusDrawerBar(),
        appBar: AppBar(),
        body: ListView.separated(
            shrinkWrap: true,
            primary: true,
            itemBuilder: (ctx, index) {
              return SizedBox(
                width: double.infinity,
                height: 400,
                child: GridView(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  children:  [
                    GestureDetector(
                      onTap: ()=>{
                      Get.to(const BuyView())
                      },
                      child:const Card(
                        elevation: 5,
                        child: Center(
                          child: Text("123"),
                        ),
                      ) ,
                    )
                    ,
                    Card(
                      elevation: 5,
                      child: Center(
                        child: Text("123"),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Center(
                        child: Text("123"),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Center(
                        child: Text("123"),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Center(
                        child: Text("123"),
                      ),
                    ),
                    Card( elevation: 5,
                      child: Center(
                        child: Text("123"),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const ListTile(
                title: Text('2021'),
              );
            },
            itemCount: 3));
  }
}
