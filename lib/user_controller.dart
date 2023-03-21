import 'package:get/get.dart';

class UserController extends RxController {
  //data
  RxString email = ''.obs;

  //function
  login(String localemail) {
    email = localemail.obs;
  }
}
