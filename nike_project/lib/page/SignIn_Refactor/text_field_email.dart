import 'package:flutter/material.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/view_models/sign_in_validation.dart';

TextField buildTextFieldEmail(
    SignInValidationProvider validationProvider, BuildContext context) {
  return TextField(
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.email),
      suffixIcon: validationProvider.textEmailController.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => validationProvider.clearEmailController(),
            )
          : null,
      labelText: "Email",
      filled: true,
      fillColor: BACKGROUND_COLOR_TEXT_FIELD,
      contentPadding: const EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorText: validationProvider.email.error,
    ),
    onChanged: (String value) {
      validationProvider.changeEmail(value);
    },
    autocorrect: false, // gợi ý
    keyboardType: TextInputType.emailAddress, // have email
    textInputAction: TextInputAction.next,
    controller: validationProvider.emailController,
    focusNode: validationProvider.emailFocusNode,
    onEditingComplete: () {
      validationProvider.changeForcusEmail(context);
    },
  );
}
