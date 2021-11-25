import 'dart:io';
import 'package:image_picker/image_picker.dart';
class PicTools{
  //拍照
  static Future<void> takePic(title) async{
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera,imageQuality: 10);
    File f =  File(photo!.path);
    File newFile =(await _changeFileNameOnly(f,title+"001"));
    print(newFile);
  }
  //重新命名拍照的圖片
  static Future<File> _changeFileNameOnly(File file, String newFileName) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName +".jpg";
    return file.rename(newPath);
  }
}