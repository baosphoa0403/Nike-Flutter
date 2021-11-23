import 'package:flutter/material.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/view_models/sign_in_validation.dart';

TextField buildTextFieldPassword(
    SignInValidationProvider validationProvider, BuildContext context) {
  return TextField(
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.password_outlined),
      suffixIcon: IconButton(
        icon: validationProvider.isPasswordVisible
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
        onPressed: () => {validationProvider.changePasswordVisible()},
      ),
      labelText: "Password",
      filled: true,
      fillColor: BACKGROUND_COLOR_TEXT_FIELD,
      contentPadding: const EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorText: validationProvider.password.error,
    ),
    onChanged: (String value) {
      validationProvider.changePassword(value);
    },
    focusNode: validationProvider.passwordFocusNode,
    obscureText: validationProvider.isPasswordVisible,
    textInputAction: TextInputAction.done,
    controller: validationProvider.passwordController,
    onEditingComplete: () {
      validationProvider.changeForcusPassword(context);
    },
  );
}
