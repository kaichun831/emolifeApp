import 'dart:developer';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:package_info/package_info.dart';

class AppController extends GetxController {
  static var BASE_URL;
  static var IP;
  static var Moblie_ID;
  static var APP_VERSION;
  static var APP_NAME;
  static var USER;

  @override
  void onInit()  {
    instance();

  }

  static Future<void> instance() async {
    var myAppInfo = await PackageInfo.fromPlatform();
    var myDeviceInfo = DeviceInfoPlugin();
    APP_NAME = myAppInfo.appName;
    APP_VERSION = myAppInfo.version;
    if (Platform.isAndroid) {
      var device = _readAndroidBuildData(await myDeviceInfo.androidInfo);
      Moblie_ID = device['androidId'].toString();
    } else if (Platform.isIOS) {
      var device = _readIosDeviceInfo(await myDeviceInfo.iosInfo);
      Moblie_ID = device['identifierForVendor'].toString();
    }

    // var localStatus = await Permission.camera.status;
    // if(localStatus.isDenied){
    //
    //   log("No permission");
    // }
    // IP = await NetworkInfo().getWifiIP();


  }


  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
