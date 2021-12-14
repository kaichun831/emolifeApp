
import 'package:get/get.dart';

class LoginResponse extends Response{
  late bool Success;
  late String Code;
  late String Msg;
  late DataBean? Data;
  late int TotalCount;
  late String NewToken;

  static LoginResponse? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LoginResponse loginResponseBean = LoginResponse();
    loginResponseBean.Success = map['Success'];
    loginResponseBean.Code = map['Code'];
    loginResponseBean.Msg = map['Msg'];
    loginResponseBean.Data = DataBean.fromMap(map['Data']);
    loginResponseBean.TotalCount = map['TotalCount'];
    loginResponseBean.NewToken = map['NewToken'];
    return loginResponseBean;
  }

  Map toJson() => {
    "Success": Success,
    "Code": Code,
    "Msg": Msg,
    "Data": Data,
    "TotalCount": TotalCount,
    "NewToken": NewToken,
  };
}

class DataBean {
  late String Account;
  late String Name;
  late String AuthLevel;
  late bool IsAuthorized;
  late String WhseNo;
  late String WhseName;
  late String LoginResult;
  late String LastVersionNo;
  late bool ForceUpdate;
  late String MainPath;
  late String Ip;
  late List<CustListBean?>? CustList;
  late List<GlobalListBean?>? GlobalList;

  static DataBean? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    DataBean? dataBean = DataBean();
    dataBean.Account = map['Account'];
    dataBean.Name = map['Name'];
    dataBean.AuthLevel = map['AuthLevel'];
    dataBean.IsAuthorized = map['IsAuthorized'];
    dataBean.WhseNo = map['WhseNo'];
    dataBean.WhseName = map['WhseName'];
    dataBean.LoginResult = map['LoginResult'];
    dataBean.LastVersionNo = map['LastVersionNo'];
    dataBean.ForceUpdate = map['ForceUpdate'];
    dataBean.MainPath = map['MainPath'];
    dataBean.Ip = map['Ip'];
    dataBean.CustList = [...(map['CustList'] as List  ).map((o) => CustListBean.fromMap(o))];
    dataBean.GlobalList = [...(map['GlobalList'] as List ).map((o) => GlobalListBean.fromMap(o))];
    return dataBean;
  }

  Map toJson() => {
    "Account": Account,
    "Name": Name,
    "AuthLevel": AuthLevel,
    "IsAuthorized": IsAuthorized,
    "WhseNo": WhseNo,
    "WhseName": WhseName,
    "LoginResult": LoginResult,
    "LastVersionNo": LastVersionNo,
    "ForceUpdate": ForceUpdate,
    "MainPath": MainPath,
    "Ip": Ip,
    "CustList": CustList,
    "GlobalList": GlobalList,
  };
}

class GlobalListBean {
  late String ID;
  late String Name;
  late String Value;

  static GlobalListBean? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    GlobalListBean globalListBean = GlobalListBean();
    globalListBean.ID = map['ID'];
    globalListBean.Name = map['Name'];
    globalListBean.Value = map['Value'];
    return globalListBean;
  }

  Map toJson() => {
    "ID": ID,
    "Name": Name,
    "Value": Value,
  };
}

class CustListBean {
  late String CustNo;
  late String CustName;

  static CustListBean? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    CustListBean custListBean = CustListBean();
    custListBean.CustNo = map['CustNo'];
    custListBean.CustName = map['CustName'];
    return custListBean;
  }

  Map toJson() => {
    "CustNo": CustNo,
    "CustName": CustName,
  };
}