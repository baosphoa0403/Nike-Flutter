import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nike_project/common/alert/dialog_alert.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/model/modelUserRequestLogin/user_login_request.dart';
import 'package:nike_project/model/modelUserResponse/info.dart';
import 'package:nike_project/model/modelUserResponse/info_user.dart';
import 'package:nike_project/page/Home_Page/home_page.dart';
import 'package:nike_project/repositories/auth/auth_repository.implement.dart';
import 'package:nike_project/view_models/validation_item.dart';

class SignUpValidationProvider with ChangeNotifier {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void changePasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  final _emailController =
      TextEditingController(text: "vihtse140539@fpt.edu.vn");
  final _passwordController = TextEditingController(text: "123456");

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;

  String get textEmailController => _emailController.text;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  bool validation = false;
  //getter
  ValidationItem get email => _email;
  ValidationItem get password => _password;

  void clearEmailController() {
    _emailController.clear();
    notifyListeners();
  }

  void clearPasswordController() {
    _passwordController.clear();
    notifyListeners();
  }

  void changeForcusEmail(BuildContext context) {
    final newForcus = validation && _email.error != null
        ? _emailFocusNode
        : _passwordFocusNode;
    FocusScope.of(context).requestFocus(newForcus);
  }

  void changeForcusPassword(BuildContext context) {
    submitData(context);
  }

  void changeEmail(String value) {
    // String p =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regExp = RegExp(p);
    // if (validation && value.isEmpty) {
    //   _email = ValidationItem(null, "Email is Empty");
    // } else if (validation && !regExp.hasMatch(value)) {
    //   _email = ValidationItem(null, "Email is invalid Pattern");
    // } else {
    //   _email = ValidationItem(value, null);
    // }
    // // thông báo sự thay
    // notifyListeners();
  }

  void changePassword(String value) {
    // if (validation && value.isEmpty) {
    //   _password = ValidationItem(null, "Password is Empty");
    // } else if (validation && value.length < 8) {
    //   _password = ValidationItem(null, "Password must 8 character");
    // } else {
    //   _password = ValidationItem(value, null);
    // }
    // notifyListeners();
  }

  bool get isValid {
    // if (_email.value != null && _password.value != null) {
    //   return true;
    // } else {
    //   return false;
    // }
    return true;
  }

  void submitData(BuildContext context) {
    if (!validation) {
      validation = true;
      changeEmail(_email.value ?? "");
      changePassword(_password.value ?? "");
      notifyListeners();
    } else if (validation && isValid) {
      print("FirstName: ${email.value}, LastName: ${password.value}");
    }
    // UserInfor a =
    AuthRepositoryImplement()
        .postLogin(
            URL_API + "auth/login",
            UserLoginRequest(
                email: "vihtse140539@fpt.edu.vn", password: "123456"))
        .then((result) async {
      // Create storage
      final storage = new FlutterSecureStorage();

// Read value
// String value = await storage.read(key: key);
// Read all values
// Map<String, String> allValues = await storage.readAll();
// Delete value
// await storage.delete(key: key);
// Delete all
// await storage.deleteAll();

// Write value
      await storage.write(key: "token", value: result.accessToken);
      await storage.write(key: "user", value: result.info.toJson());

      // String? value = await storage.read(key: "token");
      // String? object = await storage.read(key: "user");
      // Info a = Info.fromJson(object!);
      // print(a.toString());
      showAlertDialog(context,
          title: result.message,
          content: "bao oi ngu som",
          defaultActionText: "OK");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    });
  }
}

// sau khi nhập
