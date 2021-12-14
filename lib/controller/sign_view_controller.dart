import 'package:emolife/action/login_screen_action.dart';
import 'package:emolife/controller/app_controller.dart';

class SignViewController extends AppController {
  String errorMsg = "";
  final LoginScreenAction _action = LoginScreenAction();

  Future<bool> callLogin() async {
    var response = await _action.login();
    if (response.isOk) {
      if (response.body!.Success) {
      } else {
        errorMsg = response.body!.Msg;
      }
      return response.body!.Success;
    } else {
      errorMsg ="連線錯誤,請稍後重試";
    }
      return false;
    }
}
