import 'package:flutter/cupertino.dart';
import 'package:nike_project/viewmodel/provider/validation_item.dart';

class SignUpProvider with ChangeNotifier {
  ValidationItem _userName = ValidationItem(value: "", error: "");
  ValidationItem _password = ValidationItem(value: "", error: "");
  ValidationItem _email = ValidationItem(value: "", error: "");
  ValidationItem _name = ValidationItem(value: "", error: "");
  ValidationItem _yob = ValidationItem(value: "", error: "");
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

  ValidationItem get userName => _userName;
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

  void changeFocusEmail(BuildContext context) {
    final newFocus = _submitValid && _email.error != null
        ? _emailFocusNode
        : _passwordFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void changeUserName(String value) {
    if (value.isEmpty && _submitValid) {
      _userName = ValidationItem(value: "", error: "User Name is empty");
    }
    if (value.length < 8 && _submitValid) {
      _userName =
          ValidationItem(value: "", error: "User Name must 8 charactor");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.isEmpty && _submitValid) {
      _password = ValidationItem(value: "", error: "Password is empty");
    }
    if (value.length < 8 && _submitValid) {
      _password = ValidationItem(value: "", error: "Password must 8 charactor");
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
    if (value.length < 8) {
      _name = ValidationItem(value: "", error: "Name must 8 charactor");
    } else {
      _name = ValidationItem(value: value, error: "");
    }
    notifyListeners();
  }

  void changeYob(String value) {
    if (value.isEmpty && _submitValid) {
      _yob = ValidationItem(value: "", error: "YoB is empty");
    }
    if (value.length < 5) {
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
    if (value.length < 5) {
      _address = ValidationItem(value: "", error: "address must 5 charactor");
    } else {
      _address = ValidationItem(value: value, error: "");
    }
    notifyListeners();
  }

  bool isValid() {
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
    if (!_submitValid) {
      _submitValid =true;
      changeUserName(_userName.value);
      changePassword(_password.value);
      changeEmail(_email.value);
      changeName(_name.value);
      changeYob(_yob.value);
      changeAddress(_address.value);
      notifyListeners();
    }
  }
}
