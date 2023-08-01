import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:zilmoney_task/model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isRemember = false;

  changeRemember() {
    isRemember = isRemember ? false : true;
    notifyListeners();
  }

  Future<void> hiveLogin({required LoginModel value}) async {
    final loginBox = await Hive.openBox<LoginModel>('login_box');
    if (loginBox.isNotEmpty) {
      loginBox.deleteAt(0);
    }

    loginBox.add(value);
    notifyListeners();
  }

  Future<void> getHiveValue(context) async {
    final loginBox = await Hive.openBox<LoginModel>('login_box');

    if (loginBox.isNotEmpty) {
      LoginModel loginModel = loginBox.values.first;
      usernameController.text = loginModel.username;
      passwordController.text = loginModel.password;
      notifyListeners();
    }
  }
}
