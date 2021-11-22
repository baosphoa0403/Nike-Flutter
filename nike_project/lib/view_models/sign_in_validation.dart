import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/model/modelUserRequestLogin/user_login_request.dart';
import 'package:nike_project/page/Home_Page/home_page.dart';
import 'package:nike_project/repositories/auth/auth_repository.implement.dart';
import 'package:nike_project/toast/toast.dart';
import 'package:nike_project/view_models/validation_item.dart';

class SignInValidationProvider with ChangeNotifier {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void changePasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    if (validation && value.isEmpty) {
      _email = ValidationItem(null, "Email is Empty");
    } else if (validation && !regExp.hasMatch(value)) {
      _email = ValidationItem(null, "Email is invalid Pattern");
    } else {
      _email = ValidationItem(value, null);
    }
    // thông báo sự thay
    notifyListeners();
  }

  void changePassword(String value) {
    if (validation && value.isEmpty) {
      _password = ValidationItem(null, "Password is Empty");
    } else if (validation && value.length <= 2) {
      _password = ValidationItem(null, "Password must 3 character");
    } else {
      _password = ValidationItem(value, null);
    }
    notifyListeners();
  }

  bool get isValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void submitData(BuildContext context) {
    validation = _email.value != null &&
        _email.error == null &&
        _password.value != null &&
        _password.error == null;
    if (!validation) {
      validation = true;
      changeEmail(_email.value ?? "");
      changePassword(_password.value ?? "");
      notifyListeners();
    } else if (validation && isValid) {
      AuthRepositoryImplement()
          .postLogin(URL_API + "auth/login",
              UserLoginRequest(email: email.value!, password: password.value!))
          .then((result) async {
        const storage = FlutterSecureStorage();
        await storage.write(key: "token", value: result.accessToken);
        await storage.write(key: "user", value: result.info.toJson());
        // showAlertDialog(context,
        //     title: result.message, content: "", defaultActionText: "ok");
        showToastSuccess(result.message);
        // await Future.delayed(const Duration(milliseconds: 10));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
      }).onError((error, stackTrace) {
        print("abc");
        print(error);
      });
    }
    // UserInfor a =
  }
}

// sau khi nhập
