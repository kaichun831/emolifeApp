import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
            child:Column(
                  children: [
                    Align(child: Text("取消",style: TextStyle(fontSize: 24)),alignment: Alignment.topLeft,),
                    const Text("註冊會員",style: TextStyle(fontSize: 24)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.asset(
                          'images/goods.png',
                          fit: BoxFit.cover,
                          height:
                          MediaQuery.of(context).size.width / 3,
                          width:
                          MediaQuery.of(context).size.width / 3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text("基本資訊",style: TextStyle(fontSize: 16),),
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
  }

}