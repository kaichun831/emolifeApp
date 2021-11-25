import 'package:emolife_purchasing/view/widget/drawer_bar.dart';
import 'package:flutter/material.dart';


class BuyView extends StatefulWidget{
   const BuyView({Key? key}) : super(key: key);

  @override
  State<BuyView> createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        drawer: const CusDrawerBar(),
        appBar: AppBar(),
        body:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx,index){
              return
                Align(
                    widthFactor: 0.9,
                    child:
                Container(
                  height: 150,
                  width: 150,
                  child:Card(elevation:10,child: Center(child: Text('Card')),)
              ));
            },itemCount: 30,)

      );
  }
}