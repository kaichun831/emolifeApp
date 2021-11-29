import 'package:emolife_purchasing/view/widget/drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FollowMainScreen extends StatefulWidget {
  const FollowMainScreen({Key? key}) : super(key: key);

  @override
  State<FollowMainScreen> createState() => _FollowMainScreenState();
}

class _FollowMainScreenState extends State<FollowMainScreen> {
  var isHasNotification = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const CusDrawerBar(),
        appBar:_appBar() ,
        body: ListView.separated(
            shrinkWrap: true,
            primary: true,
            itemBuilder: (ctx, index) {
              return SizedBox(
                  width: MediaQuery.of(ctx).size.width,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return _groupItem(index);
                        }),
                  ));
            },
            separatorBuilder: (ctx, index) {
              return const ListTile(
                title: Text('2021'),
              );
            },
            itemCount: 3));
  }
  AppBar _appBar(){
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
        title: const Text("跟團活動", style: TextStyle(color: Colors.black)));
  }
  Widget _groupItem(int index) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 210,
              width: double.infinity,
              color: Colors.blueGrey.withAlpha(40),
              child: Image.network(
                'https://joycat.org/images/photoedit/20170922_153626-800x600.jpg',
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
            Container(
              height: 70,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      child: Text('咸'),
                      radius: 30,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "30件廚房實用組",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      Text(
                        "截止日2021/12/31",
                        style:
                            TextStyle(color: Color.fromRGBO(248, 110, 110, 1)),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
            child: Container(
          color: Color.fromRGBO(248, 110, 110, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Text(
              "倒數31天又5小時",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )),
      ],
    );
  }
}
