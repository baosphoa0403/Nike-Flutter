abstract class StringValidator {
  bool isStringEmpty(String value);
  bool isEmailValid(String value);
}

class checkStringValidator extends StringValidator {
  @override
  bool isStringEmpty(String value) {
    return value.isEmpty;
  }

  @override
  bool isEmailValid(String value) {
    String p=
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(value);
  }
}

// mixin is class and used to extend existing classes
class EmailAndPasswordValidator {
  final StringValidator emailValidator = checkStringValidator();
  final StringValidator passValidator = checkStringValidator();
  final String invalidEmailInValidFormat = "Email invalid format";
  final String invalidEmailErrorText = "Email can't be empty";
  final String invalidPassErrorText = "Pass can't be empty";
}