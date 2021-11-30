import 'package:emolife_purchasing/view/widget/drawer_bar.dart';
import 'package:flutter/material.dart';

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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                      shape: const StadiumBorder(),
                                      primary: const Color.fromRGBO(
                                          248, 110, 110, 1)))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40, top: 20, bottom: 20),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(150)),
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
                                    shape: const StadiumBorder(),
                                    primary:
                                        const Color.fromRGBO(255, 139, 45, 1)),
                              )
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
                          Text("聯絡電話:0968-123456"),
                          Text("電子信箱:kaichun831@gmail.com"),
                          Text("生日:1993/08/31")
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isOpenUserInfo = !isOpenUserInfo;
                            _settingInfo();
                          });
                        },
                        child: const Text('編輯基本資訊'),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: const Color.fromRGBO(101, 108, 238, 1)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: const [
                          Text("預設店到店:薰衣草門市 7-11"),
                          Text("可交易地區:台中市"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('變更交易資訊'),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: const Color.fromRGBO(101, 108, 238, 1)),
                      ),
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

  void _settingInfo() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.35,
              minChildSize: 0.07,
              maxChildSize: 0.35,
              builder: (ctx, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.black12)]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text('取消',
                                    style: TextStyle(
                                        color: Color.fromRGBO(176, 176, 176, 1),
                                        fontSize: 20)),
                                Text(
                                  '編輯基本資訊',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '完成',
                                  style: TextStyle(
                                      color: Color.fromRGBO(101, 108, 238, 1),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("用戶姓名"),
                                    Expanded(child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: "Email",
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
        Text('開團評比:★★★★☆'),
        Text('開團次數:3'),
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
