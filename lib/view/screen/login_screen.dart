import 'package:emolife/action/login_screen_action.dart';
import 'package:emolife/controller/sign_view_controller.dart';
import 'package:emolife/tools/color_tools.dart';
import 'package:emolife/tools/time_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userEmail = "";
  var userPassword = "";
  var myDate = "2021-12-04T14:30:00";
  var endDate = "2021-12-05T14:30:00";
  var model = LoginScreenAction();

  // AppController _appController = Get.put(AppController());
  final SignViewController _controller = Get.put(SignViewController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                ),
                const Flexible(
                    child: SizedBox(
                  height: 20,
                )),
                const Text(
                  "咸青",
                  style: TextStyle(fontSize: 30),
                ),
                const Flexible(
                    child: SizedBox(
                  height: 30,
                )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 10, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 5, bottom: 10, right: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                          icon: Icon(Icons.person_pin),
                        ),
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onSaved: (email) {
                          userEmail = email!;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 5, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(
                                1, 2), // changes position of shadow
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 5, bottom: 5, right: 5),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                        ),
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onSaved: (pwd) {
                          userPassword = pwd!;
                        },
                      ),
                    ),
                  ),
                ),
                const Flexible(
                    child: SizedBox(
                  height: 20,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "忘記密碼",
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                        child: const Text("註冊會員",
                            style: TextStyle(color: Colors.indigoAccent)),
                        onTap: () => _showRegister()),
                  ],
                ),
                const Flexible(
                    child: SizedBox(
                  height: 20,
                )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 0, bottom: 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(248, 110, 110, 1),
                    ),
                    onPressed: () async {
                      // Get.toNamed("/follow");
                      _controller.callLogin().then((result) => {
                            if (result)
                              TimeUtil.delay(1, () => Get.toNamed("/follow"))
                            else
                              Get.snackbar(_controller.errorMsg, "")
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80)),
                          width: double.infinity,
                          child: const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20),
                          ))),
                    ),
                  ),
                ),
                Flexible(child: const SizedBox(height: 15)),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                      Text('   OR   '),
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        height: 1,
                      )),
                    ],
                  ),
                ))
              ]),
        ),
      ),
      onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    ));
  }

  void _showRegister() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.9,
              minChildSize: 0.07,
              maxChildSize: 0.9,
              builder: (ctx, scrollController) {
                return SingleChildScrollView(
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
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                child: GestureDetector(
                                  child: Text("取消",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.withAlpha(80))),
                                  onTap: () => {Get.back()},
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ),
                            const Text("註冊會員", style: TextStyle(fontSize: 24)),
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
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "基本資訊",
                              style: TextStyle(fontSize: 16),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 35, right: 35.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
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
                                              keyboardType:
                                                  TextInputType.number,
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("加入開團"),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                            MediaQuery.of(context).size.height /
                                                14),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        primary: ColorUtil.mainRedColor()),
                                  )
                                ],
                              ),
                            )
                          ],
                        )));
              });
        });
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
  }
}
