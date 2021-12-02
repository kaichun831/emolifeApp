import 'package:emolife_purchasing/constans.dart';
import 'package:emolife_purchasing/models/orders_model.dart';
import 'package:emolife_purchasing/tools/color_tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<OrdersModel> _models = [];

class BuyCartsView extends StatefulWidget {
  const BuyCartsView({Key? key}) : super(key: key);

  @override
  State<BuyCartsView> createState() => _BuyCartsViewState();
}

class _BuyCartsViewState extends State<BuyCartsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  int selectedPosition = 0;
  var fakeData = Constans.fakeData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _models = Constans.getFakeModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  color: Colors.grey.withAlpha(50),
                  height: MediaQuery.of(context).size.height / 2 / 1.2,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: _models.first.orderData!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Image.network(
                          _models.first.orderData![index].GoodUrl,
                          loadingBuilder: (ctx, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                                child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ));
                          },
                        );
                      })),
              Positioned(
                  left: 10,
                  top: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, shape: const StadiumBorder()),
                      child: Text(
                        "< Go Back",
                        style: TextStyle(color: ColorUtil.mainRedColor()),
                      ),
                      onPressed: () {
                        Get.back();
                      })),
              Positioned(
                  right: 10,
                  top: 60,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          Icons.keyboard_control_rounded,
                          color: ColorUtil.mainRedColor(),
                        ),
                        onPressed: () {},
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _models.first.orderInfo!.OrderName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ID:${_models.first.orderInfo!.OrderNo}",
                      style: TextStyle(color: ColorUtil.mainBlueColor()),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite,
                            size: 18, color: ColorUtil.mainRedColor()))
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            offset: Offset(1, 1))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: ColorUtil.mainRedColor(),
                        ),
                        Expanded(
                            child: Text(
                          '截止日2021/11/31 倒數: 20天11小時35分',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorUtil.mainRedColor(),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                          child: Text("單品詳情"),
                        ),
                        Tab(
                          child: Text("全部商品"),
                        ),
                        Tab(
                          child: Text("團長簡介"),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 650,
                  width: MediaQuery.of(context).size.width,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _singleGoodInfoView(),
                      _groupAllDetailView(),
                      _aboutGroupLeaderView()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  /// 全部商品
  Widget _groupAllDetailView() {
    return Stack(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(20),
                          spreadRadius: 0.8,
                          blurRadius: 2)
                    ]),
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Scrollbar(
                        child: ListView.builder(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height / 12),
                            itemCount: _models.first.orderData!.length,
                            itemBuilder: (ctx, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            color:
                                                Colors.blueGrey.withAlpha(70),
                                            child: GestureDetector(
                                              child: Image.network(
                                                _models.first.orderData![index]
                                                    .GoodUrl,
                                                loadingBuilder: (ctx, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ));
                                                },
                                              ),
                                              onTap: () {
                                                _pageController.animateToPage(
                                                  index,
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.linearToEaseOut,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _models.first.orderData![index]
                                                  .GoodsName,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "規格 : ${_models.first.orderData![index].GoodsColor}",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  "   NT\$ ${_models.first.orderData![index].GoodsPrice}",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: ColorUtil
                                                          .mainRedColor()),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (_models.first.orderData![index]
                                                    .buyCount >
                                                0) {
                                              _models.first.orderData![index]
                                                  .buyCount--;
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.remove_circle_outline_outlined,
                                          color: _models.first.orderData![index]
                                                      .buyCount >
                                                  0
                                              ? const Color.fromRGBO(
                                                  249, 128, 128, 1)
                                              : Colors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${_models.first.orderData![index].buyCount}",
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _models.first.orderData![index]
                                                .buyCount++;
                                          });
                                        },
                                        child: Icon(
                                          Icons.add_circle_outline_rounded,
                                          color: _models.first.orderData![index]
                                                      .buyCount >
                                                  0
                                              ? const Color.fromRGBO(
                                                  249, 128, 128, 1)
                                              : Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            }))))),
        getAddCount()?
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                        MediaQuery.of(context).size.width / 2,
                        MediaQuery.of(context).size.height / 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    primary: ColorUtil.mainRedColor()),
                child: const Text(
                  "我要參團",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )):const SizedBox()
      ],
    );
  }

  ///單品詳情
  Widget _singleGoodInfoView() {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(20),
                      spreadRadius: 0.8,
                      blurRadius: 2)
                ]),
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Scrollbar(
                    child: Stack(
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 12),
                      itemCount: _models.first.orderData!.length,
                      itemBuilder: (ctx, index) {
                        return _singleGoodItem(index);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 40,
                          thickness: 1,
                        );
                      },
                    ),
                    getAddCount()?
                    Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width / 2,
                                    MediaQuery.of(context).size.height / 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                primary: ColorUtil.mainRedColor()),
                            child: const Text(
                              "我要參團",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )):const SizedBox()
                  ],
                )))));
  }

  ///團長簡介
  Widget _aboutGroupLeaderView() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(20),
                  spreadRadius: 0.8,
                  blurRadius: 2)
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                'images/goods.png',
                fit: BoxFit.cover,
                height: 144,
                width: 144,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              _models.first.leaderInfo!.Name,
              style: TextStyle(color: Colors.black, fontSize: 21),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("追蹤"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: ColorUtil.mainOrangeColor()),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("整體評價", style: TextStyle(fontSize: 14)),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_models.first.leaderInfo!.Score.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.star,
                          color: ColorUtil.mainRedColor(),
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "已開團數",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(_models.first.leaderInfo!.CreateTimes.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "追蹤人數",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(_models.first.leaderInfo!.FollowCount.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                height: 35,
                thickness: 1,
                color: Colors.grey.withAlpha(60),
              ),
            ),
            const Text("團長簡介",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(_models.first.leaderInfo!.About,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "sans-serif")),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                height: 35,
                thickness: 1,
                color: Colors.grey.withAlpha(60),
              ),
            ),
            const Text("團長開團",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
            Expanded(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Scrollbar(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                _models.first.leaderInfo!.OrderInfos.length,
                            itemBuilder: (ctx, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            color:
                                                Colors.blueGrey.withAlpha(70),
                                            child: GestureDetector(
                                              child: Image.network(
                                                'https://joycat.org/images/photoedit/20170922_153626-800x600.jpg',
                                                loadingBuilder: (ctx, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ));
                                                },
                                              ),
                                              onTap: () {
                                                _pageController.animateToPage(
                                                  index,
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.linearToEaseOut,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _models.first.leaderInfo!
                                                  .OrderInfos[index].OrderName,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "截止日期:${_models.first.leaderInfo!.OrderInfos[index].IssueEndTime}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      ColorUtil.mainRedColor()),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }))))
          ],
        ),
      ),
    );
  }
  Widget _singleGoodItem(int position) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              _models.first.orderData![position].GoodUrl,
              loadingBuilder: (ctx, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                    child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "已參團數 10",
                style: TextStyle(
                    color: Color.fromRGBO(249, 128, 128, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_models.first.orderData![position].buyCount > 0) {
                          _models.first.orderData![position].buyCount--;
                        }
                      });
                    },
                    child: Icon(
                      Icons.remove_circle_outline_outlined,
                      color: _models.first.orderData![position].buyCount > 0
                          ? const Color.fromRGBO(249, 128, 128, 1)
                          : Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${_models.first.orderData![position].buyCount}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _models.first.orderData![position].buyCount++;
                      });
                    },
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      color: _models.first.orderData![position].buyCount > 0
                          ? const Color.fromRGBO(249, 128, 128, 1)
                          : Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          Text(
            _models.first.orderData![position].GoodsName,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "規格-${_models.first.orderData![position].GoodsColor}",
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            TextSpan(
                text: "   NT\$${_models.first.orderData![position].GoodsPrice}",
                style: const TextStyle(
                    color: Color.fromRGBO(249, 128, 128, 1), fontSize: 14))
          ])),
          const SizedBox(
            height: 5,
          ),
          Text(
            _models.first.orderData![position].GoodsDescription,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ],
      ),
    );
  }
  bool getAddCount(){
    for(var i =0;i<_models.first.orderData!.length;i++){
      if(_models.first.orderData![i].buyCount>0){
        return true;
      }
    }
    return false;
  }
}
