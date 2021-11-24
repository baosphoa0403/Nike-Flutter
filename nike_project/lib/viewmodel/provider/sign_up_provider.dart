import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/repositories/impl/sign_up_impl_repository.dart';
import 'package:nike_project/view/common/toast/toast.dart';
import 'package:nike_project/viewmodel/contants/contants.dart';
import 'package:nike_project/viewmodel/validation_item.dart';

class SignUpProvider with ChangeNotifier {
  ValidationItem _userName = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _yob = ValidationItem(null, null);
  ValidationItem _address = ValidationItem(null, null);

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

  bool isPasswordVisible = true;

  void changePasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get emailController => _emailController;
  TextEditingController get nameController => _nameController;
  TextEditingController get yobController => _yobController;
  TextEditingController get addressController => _addressController;

  String get textUserNameController => _userNameController.text;
  String get textPasswordController => _passwordController.text;
  String get textEmailController => _emailController.text;
  String get textNameController => _nameController.text;
  String get textYobController => _yobController.text;
  String get textAddressController => _addressController.text;

  FocusNode get userNameFocusNode => _userNameFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get nameFocusNode => _nameFocusNode;
  FocusNode get yobFocusNode => _yobFocusNode;
  FocusNode get addressFocusNode => _addressFocusNode;

  ValidationItem get username => _userName;
  ValidationItem get password => _password;
  ValidationItem get email => _email;
  ValidationItem get name => _name;
  ValidationItem get yob => _yob;
  ValidationItem get address => _address;

  void clearUserNameController() {
    _userNameController.clear();
    notifyListeners();
  }

  void clearPasswordController() {
    _passwordController.clear();
    notifyListeners();
  }

  void clearEmailController() {
    _emailController.clear();
    notifyListeners();
  }

  void clearNameController() {
    _nameController.clear();
  }

  void clearYobController() {
    _yobController.clear();
    notifyListeners();
  }

  void clearAddressController() {
    _addressController.clear();
    notifyListeners();
  }

  void changeFocus(BuildContext context, String field) {
    var newFocus = _userNameFocusNode;
    if (_userName.value != null && field.contains("username")) {
      newFocus = _passwordFocusNode;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_password.value != null && field.contains("password")) {
      newFocus = _emailFocusNode;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_email.value != null && field.contains("email")) {
      newFocus = _nameFocusNode;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_name.value != null && field.contains("name")) {
      newFocus = _yobFocusNode;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_yob.value != null && field.contains("yob")) {
      newFocus = _addressFocusNode;
      FocusScope.of(context).requestFocus(newFocus);
      return;
    }
    if (_address.value != null && field.contains("address")) {
      FocusScope.of(context).unfocus();
      submitData(context);
    }
  }

  void changeUserName(String value) {
    if (value.isEmpty && _submitValid) {
      _userName = ValidationItem(null, "User Name is empty");
    } else if (value.length < 4 && _submitValid) {
      _userName = ValidationItem(null, "User Name must 4 charactor");
    } else {
      _userName = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.isEmpty && _submitValid) {
      _password = ValidationItem(null, "Password is empty");
    } else if (value.length < 6 && _submitValid) {
      _password = ValidationItem(null, "Password must 6 charactor");
    } else {
      _password = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(p);
    if (value.isEmpty && _submitValid) {
      _email = ValidationItem(null, "Email is empty");
    } else if (_submitValid && !regex.hasMatch(value)) {
      _email = ValidationItem(null, "Email is invalid Pattern");
    } else {
      _email = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeName(String value) {
    if (value.isEmpty && _submitValid) {
      _name = ValidationItem(null, "Name is empty");
    } else if (value.length < 4 && _submitValid) {
      _name = ValidationItem(null, "Name must 4 charactor");
    } else {
      _name = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeYob(String value) {
    if (value.isEmpty && _submitValid) {
      _yob = ValidationItem(null, "YoB is empty");
    } else if (int.parse(value) < 1900 && _submitValid) {
      _yob = ValidationItem(null, "YoB must form 1900 year or birth");
    } else {
      _yob = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void changeAddress(String value) {
    if (value.isEmpty && _submitValid) {
      _address = ValidationItem(null, "Address is empty");
    } else if (value.length < 4 && _submitValid) {
      _address = ValidationItem(null, "address must 4 charactor");
    } else {
      _address = ValidationItem(value, null);
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

  void submitData(BuildContext context) {
    _submitValid = _userName.value != null &&
        _userName.error == null &&
        _password.value != null &&
        _password.error == null &&
        _email.value != null &&
        _email.error == null &&
        _name.value != null &&
        _name.error == null &&
        _yob.value != null &&
        _yob.error == null &&
        _address.value != null &&
        _address.error == null;
    if (!_submitValid) {
      _submitValid = true;
      changeUserName(_userName.value ?? "");
      changePassword(_password.value ?? "");
      changeEmail(_email.value ?? "");
      changeName(_name.value ?? "");
      changeYob(_yob.value ?? "");
      changeAddress(_address.value ?? "");
      notifyListeners();
    } else if (_submitValid && isValid) {
      SignUpImplRepository()
          .postSignUp(
              URL_SIGNUP,
              UserSignUpRequest(
                  username: username.value!,
                  email: email.value!,
                  password: password.value!,
                  name: name.value!,
                  yearOfBirth: int.parse(yob.value!),
                  address: address.value!))
          .then((result) async {
        const storage = FlutterSecureStorage();
        await storage.write(key: "user", value: result?.toJson());
        showToastSuccess("SignUp Success");
      }).onError((error, stackTrace) {
        print("Error Call API");
      });
    }
    ;
  }
}
