import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/model/service/impl/sign_up_impl_service.dart';
import 'package:nike_project/model/service/sign_up_service.dart';
import 'package:nike_project/viewmodel/validation_item.dart';

class SignUpProvider with ChangeNotifier {
  ValidationItem _userName = ValidationItem(value: "", error: "");
  ValidationItem _password = ValidationItem(value: "", error: "");
  ValidationItem _email = ValidationItem(value: "", error: "");
  ValidationItem _name = ValidationItem(value: "", error: "");
  ValidationItem _yob = ValidationItem(value: 0, error: "");
  ValidationItem _address = ValidationItem(value: "", error: "");

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _yobController = TextEditingController();
  final _addressController = TextEditingController();

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _yobFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  bool _submitValid = false;

  bool _isPasswordVisible = true;

  void changePasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get emailController => _emailController;
  TextEditingController get nameController => _nameController;
  TextEditingController get yobController => _yobController;
  TextEditingController get addressController => _addressController;

  FocusNode get userNameFocusNode => _userNameFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get nameFocusNode => _nameFocusNode;
  FocusNode get yobFocusNode => _yobFocusNode;
  FocusNode get addressFocusNode => _addressFocusNode;

  String get textEmailController => _emailController.text;

  ValidationItem get username => _userName;
  ValidationItem get password => _password;
  ValidationItem get email => _email;
  ValidationItem get name => _name;
  ValidationItem get yob => _yob;
  ValidationItem get address => _address;

  void clearEmailController() {
    _emailController.clear();
    notifyListeners();
  }

  void clearPasswordController() {
    _passwordController.clear();
    notifyListeners();
  }

  final validation = false;

  // void changeFocusEmail(BuildContext context) {
  //   final newFocus = _submitValid && _email.error != null
  //       ? _emailFocusNode
  //       : _passwordFocusNode;
  //   FocusScope.of(context).requestFocus(newFocus);
  // }

  void changeUserName(String value) {
    if (value.isEmpty && _submitValid) {
      _userName = ValidationItem(value: "", error: "User Name is empty");
    }
    if (value.length < 1 && _submitValid) {
      _userName =
          ValidationItem(value: "", error: "User Name must 1 charactor");
    } else {
      _userName = ValidationItem(value: value, error: "");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.isEmpty && _submitValid) {
      _password = ValidationItem(value: "", error: "Password is empty");
    }
    if (value.length < 1 && _submitValid) {
      _password = ValidationItem(value: "", error: "Password must 1 charactor");
    } else {
      _password = ValidationItem(value: value, error: "");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp _regex = RegExp(regex);
    if (value.isEmpty && _submitValid) {
      _email = ValidationItem(error: "Email is empty", value: "");
    }
    if (_regex.hasMatch(value) && _submitValid) {
      _email = ValidationItem(error: "Email is invalid Pattern", value: "");
    } else {
      _email = ValidationItem(value: value, error: "");
    }
    notifyListeners();
  }

  void changeName(String value) {
    if (value.isEmpty && _submitValid) {
      _name = ValidationItem(value: "", error: "Name is empty");
    }
    if (value.length < 1) {
      _name = ValidationItem(value: "", error: "Name must 1 charactor");
    } else {
      _name = ValidationItem(value: value, error: "");
    }
    notifyListeners();
  }

  void changeYob(String value) {
    if (value.isEmpty && _submitValid) {
      _yob = ValidationItem(value: "", error: "YoB is empty");
    }
    if (value.length < 1) {
      _yob = ValidationItem(value: "", error: "YoB must 5 charactor");
    } else {
      _yob = ValidationItem(value: value, error: "");
    }
    notifyListeners();
  }

  void changeAddress(String value) {
    if (value.isEmpty && _submitValid) {
      _address = ValidationItem(value: "", error: "Address is empty");
    }
    if (value.length < 1) {
      _address = ValidationItem(value: "", error: "address must 1 charactor");
    } else {
      _address = ValidationItem(value: value, error: "");
    }
    notifyListeners();
  }

  bool get isValid {
    if (_userName.value != null &&
        _password.value != null &&
        _email.value != null &&
        _name.value != null &&
        _yob.value != null &&
        _address.value != null) {
      return true;
    }
    return false;
  }

  void submitData() {
    bool valid = _userName.value != null &&
        _password.value != null &&
        _email.value != null &&
        _name.value != null &&
        _yob.value != null &&
        _address.value != null;
    if (!valid) {
      valid = true;
      changeUserName(_userName.value);
      changePassword(_password.value);
      changeEmail(_email.value);
      changeName(_name.value);
      changeYob(_yob.value);
      changeAddress(_address.value);
      notifyListeners();
    } else if (valid && isValid) {
      SignUpImplService()
          .postSignUp(UserSignUpRequest(
              username: username.value,
              email: email.value,
              password: password.value,
              name: name.value,
              yearOfBirth: int.parse(yob.value),
              address: address.value))
          .then((result) async {
        const storage = FlutterSecureStorage();
        await storage.write(key: "user", value: result?.toJson());
      }).onError((error, stackTrace) {
        print("aaaa");
      });
    }
    ;
  }
}
