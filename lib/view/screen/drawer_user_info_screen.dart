import 'package:emolife/tools/color_tools.dart';
import 'package:emolife/view/widget/drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen>
    with SingleTickerProviderStateMixin {
  var isHasNotification = true;
  late TabController _tabController;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var controllerX = ScrollController();
  var isOpenUserInfo = false;
  var isOpenUserTrade = false;

  // ///滑动控制器
  // late ScrollController scrollController;
  //
  // ///抽屉控制器
  // late DragController dragController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // scrollController = ScrollController();
    // dragController = DragController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const CusDrawerBar(),
        appBar: _appBar(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('預扣點數'),
                              const Text(
                                '199',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('查看'),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      primary: ColorUtil.mainRedColor()))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(300),
                              child: Image.asset(
                                'images/goods.png',
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.width / 3,
                                width: MediaQuery.of(context).size.width / 3,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('點數餘額'),
                              const Text(
                                '899',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('儲值'),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      primary: ColorUtil.mainOrangeColor()))
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        '阿團',
                        style: TextStyle(
                            color: const Color.fromRGBO(101, 108, 238, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: const [
                          Text("用戶姓名:王阿團"),
                          SizedBox(
                            height: 2,
                          ),
                          Text("聯絡電話:0968-123456"),
                          SizedBox(
                            height: 2,
                          ),
                          Text("電子信箱:kaichun831@gmail.com"),
                          SizedBox(
                            height: 2,
                          ),
                          Text("生日:1993/08/31")
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _settingUserInfo();
                            });
                          },
                          child: const Text('編輯基本資訊'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              primary: ColorUtil.mainBlueColor())),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: const [
                          Text("預設店到店:薰衣草門市 7-11"),
                          SizedBox(
                            height: 2,
                          ),
                          Text("可交易地區:台中市"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _settingAddressInfo();
                          },
                          child: const Text('變更交易資訊'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              primary: ColorUtil.mainBlueColor())),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50.0),
                        child: TabBar(
                            controller: _tabController,
                            labelColor: Colors.black,
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  width: 3.0,
                                  color: Color.fromRGBO(248, 110, 110, 1)),
                              insets: EdgeInsets.symmetric(horizontal: 80),
                            ),
                            unselectedLabelColor: Colors.grey,
                            tabs: const [
                              Tab(
                                child: Text("開團"),
                              ),
                              Tab(
                                child: Text("跟團"),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 580,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            StartGroupView(),
                            FlowGroupView(),
                          ],
                        ),
                      ),
                      // buildDragWidget()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _settingUserInfo() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.8,
              minChildSize: 0.07,
              maxChildSize: 0.8,
              builder: (ctx, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black12)]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: const Text('取消',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(176, 176, 176, 1),
                                          fontSize: 20)),
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                                const Text(
                                  '編輯基本資訊',
                                  style: TextStyle(fontSize: 20),
                                ),
                                GestureDetector(
                                  child: Text(
                                    '完成',
                                    style: TextStyle(
                                        color: Color.fromRGBO(101, 108, 238, 1),
                                        fontSize: 20),
                                  ),
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35, right: 35.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.grey.withAlpha(60),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child: Text(
                                          "用戶姓名",
                                          style: TextStyle(fontSize: 16),
                                        )),
                                    Expanded(
                                        child: TextFormField(
                                            decoration: const InputDecoration(
                                      hintText: "Email",
                                      border: InputBorder.none,
                                    )))
                                  ],
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.grey.withAlpha(60),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                        width: 100,
                                        child: Text(
                                          "連絡電話",
                                          style: TextStyle(fontSize: 16),
                                        )),
                                    Expanded(
                                        child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            textInputAction:
                                                TextInputAction.done,
                                            decoration: const InputDecoration(
                                              hintText: "0968-123456",
                                              border: InputBorder.none,
                                            )))
                                  ],
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.grey.withAlpha(60),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child: Text(
                                          "電子郵件",
                                          style: TextStyle(fontSize: 16),
                                        )),
                                    Expanded(
                                        child: TextFormField(
                                            decoration: const InputDecoration(
                                      hintText: "abcd@gmail.com",
                                      border: InputBorder.none,
                                    )))
                                  ],
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.grey.withAlpha(60),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child: Text(
                                          "生日",
                                          style: TextStyle(fontSize: 16),
                                        )),
                                    Expanded(
                                        child: TextFormField(
                                            decoration: const InputDecoration(
                                      hintText: "1990/01/01",
                                      border: InputBorder.none,
                                    )))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              });
        });
  }

  void _settingAddressInfo() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.8,
              minChildSize: 0.07,
              maxChildSize: 0.8,
              builder: (ctx, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black12)]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: const Text('取消',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(176, 176, 176, 1),
                                          fontSize: 20)),
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                                const Text(
                                  '變更交易資訊',
                                  style: TextStyle(fontSize: 20),
                                ),
                                GestureDetector(
                                  child: const Text(
                                    '完成',
                                    style: TextStyle(
                                        color: Color.fromRGBO(101, 108, 238, 1),
                                        fontSize: 20),
                                  ),
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35, right: 35.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.grey.withAlpha(60),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                        width: 100,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            "預設店到店",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        )),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "7-11薰衣草門市",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          "選擇預設店家",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: ColorUtil.mainBlueColor()),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.grey.withAlpha(60),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                        width: 100,
                                        child: Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              "可交易地區",
                                              style: TextStyle(fontSize: 16),
                                            ))),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width:180,
                                              child: Text(
                                                "台中地區 新社地區 太平區 台中地區 新社地區 太平區",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Text(
                                              "新增可面交地區",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: ColorUtil
                                                      .mainBlueColor()),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              });
        });
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Stack(
            children: [
              Positioned(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.blueGrey,
                      size: 26,
                    )),
              ),
              isHasNotification
                  ? Positioned(
                      child: CircleAvatar(
                        child: Text(''),
                        backgroundColor: Colors.red,
                        radius: 5,
                      ),
                      right: 8,
                      top: 8,
                    )
                  : SizedBox()
            ],
          ),
        )
      ],
      leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.black,
          )),
      backgroundColor: Colors.white,
      title: const Text(
        "個人資訊",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class StartGroupView extends StatefulWidget {
  const StartGroupView({Key? key}) : super(key: key);

  @override
  State<StartGroupView> createState() => _StartGroupViewState();
}

class _StartGroupViewState extends State<StartGroupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text('開團評比:★★★★☆'),
        SizedBox(
          height: 10,
        ),
        Text('開團次數:3'),
        SizedBox(
          height: 5,
        ),
        Text('為您省下:666 \$'),
        SizedBox(
          height: 20,
        ),
        _getOrdersView()
      ],
    ));
  }

  Widget _getOrdersView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '已完成單據',
          style: TextStyle(fontSize: 10),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withAlpha(80), width: 2)),
          child: Container(
              constraints: const BoxConstraints(maxHeight: 220),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "團長",
                          style: TextStyle(
                              color: const Color.fromRGBO(101, 108, 238, 1)),
                        ),
                        Text(
                          "完成接收日",
                          style: TextStyle(
                              color: const Color.fromRGBO(101, 108, 238, 1)),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Scrollbar(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (ctx, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0,
                                        right: 15,
                                        top: 6,
                                        bottom: 6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Leader $index",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "2021-12-30",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ))
                  ],
                ),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '已成立單據',
          style: TextStyle(fontSize: 10),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withAlpha(80), width: 2)),
          child: Container(
              constraints: const BoxConstraints(maxHeight: 220),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "團長",
                          style: TextStyle(
                              color: Color.fromRGBO(101, 108, 238, 1)),
                        ),
                        Text(
                          "完成接收日",
                          style: TextStyle(
                              color: Color.fromRGBO(101, 108, 238, 1)),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Scrollbar(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (ctx, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0,
                                        right: 15,
                                        top: 6,
                                        bottom: 6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Leader $index",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "2021-12-30",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ))
                  ],
                ),
              )),
        ),
      ],
    );
  }
}

class FlowGroupView extends StatefulWidget {
  const FlowGroupView({Key? key}) : super(key: key);

  @override
  State<FlowGroupView> createState() => _FlowGroupViewState();
}

class _FlowGroupViewState extends State<FlowGroupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        _getOrdersView()
      ],
    ));
  }

  Widget _getOrdersView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '已完成單據',
          style: TextStyle(fontSize: 10),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withAlpha(80), width: 2)),
          child: Container(
              constraints: const BoxConstraints(maxHeight: 240),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "團長",
                          style: TextStyle(
                              color: const Color.fromRGBO(101, 108, 238, 1)),
                        ),
                        Text(
                          "完成接收日",
                          style: TextStyle(
                              color: const Color.fromRGBO(101, 108, 238, 1)),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Scrollbar(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (ctx, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0,
                                        right: 15,
                                        top: 6,
                                        bottom: 6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Leader $index",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "2021-12-30",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ))
                  ],
                ),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '已成立單據',
          style: TextStyle(fontSize: 10),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withAlpha(80), width: 2)),
          child: Container(
              constraints: const BoxConstraints(maxHeight: 240),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "團長",
                          style: TextStyle(
                              color: Color.fromRGBO(101, 108, 238, 1)),
                        ),
                        Text(
                          "完成接收日",
                          style: TextStyle(
                              color: Color.fromRGBO(101, 108, 238, 1)),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Scrollbar(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (ctx, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0,
                                        right: 15,
                                        top: 6,
                                        bottom: 6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Leader $index",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "2021-12-30",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ))
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
