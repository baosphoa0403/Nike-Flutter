import 'package:flutter/material.dart';
import 'package:nike_project/view/common/Button/elevated_button_custom.dart';
import 'package:nike_project/view/contants/contants.dart';
import 'package:nike_project/view_models/provider/sign_up_provider.dart';
import 'package:provider/provider.dart';

class BodySignUp extends StatelessWidget {
  BodySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _form(size, context, signUpProvider),
          SizedBox(height: size.height * 0.05),
          _buildSignUp(size, context, signUpProvider),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }

  Column _form(size, BuildContext context, SignUpProvider signUpProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.people),
            suffixIcon: signUpProvider.textUserNameController.isNotEmpty
                ? IconButton(
                    onPressed: () => signUpProvider.clearUserNameController(),
                    icon: Icon(Icons.close))
                : null,
            labelText: "User name",
            fillColor: Colors.lightBlue.shade50,
            filled: true,
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText: signUpProvider.username.error,
          ),
          autocorrect: false,
          keyboardType: TextInputType.text,
          onChanged: (String value) {
            signUpProvider.changeUserName(value);
          },
          focusNode: signUpProvider.userNameFocusNode,
          controller: signUpProvider.userNameController,
          onEditingComplete: () {
            signUpProvider.changeFocus(context, "username");
          },
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              suffixIcon: signUpProvider.textPasswordController.isNotEmpty
                  ? IconButton(
                      onPressed: () => {signUpProvider.changePasswordVisible()},
                      icon: signUpProvider.isPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off))
                  : null,
              labelText: "Password",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorText: signUpProvider.password.error,
            ),
            obscureText: signUpProvider.isPasswordVisible,
            keyboardType: TextInputType.text,
            onChanged: (String value) {
              signUpProvider.changePassword(value);
            },
            focusNode: signUpProvider.passwordFocusNode,
            controller: signUpProvider.passwordController,
            onEditingComplete: () {
              signUpProvider.changeFocus(context, "password");
            }),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email_sharp),
            suffixIcon: signUpProvider.textEmailController.isNotEmpty
                ? IconButton(
                    onPressed: () => signUpProvider.clearEmailController(),
                    icon: Icon(Icons.close))
                : null,
            labelText: "Email",
            fillColor: Colors.lightBlue.shade50,
            filled: true,
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText: signUpProvider.email.error,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            signUpProvider.changeEmail(value);
          },
          focusNode: signUpProvider.emailFocusNode,
          controller: signUpProvider.emailController,
          onEditingComplete: () {
            signUpProvider.changeFocus(context, "email");
          },
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.brush),
              suffixIcon: signUpProvider.textNameController.isNotEmpty
                  ? IconButton(
                      onPressed: () => signUpProvider.clearNameController(),
                      icon: Icon(Icons.close))
                  : null,
              labelText: "Name",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorText: signUpProvider.name.error),
          keyboardType: TextInputType.text,
          onChanged: (String value) {
            signUpProvider.changeName(value);
          },
          focusNode: signUpProvider.nameFocusNode,
          controller: signUpProvider.nameController,
          onEditingComplete: () {
            signUpProvider.changeFocus(context, "name");
          },
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.calendar_today_sharp),
              suffixIcon: signUpProvider.textYobController.isNotEmpty
                  ? IconButton(
                      onPressed: () => signUpProvider.clearYobController(),
                      icon: Icon(Icons.close))
                  : null,
              labelText: "Year Of Birth",
              fillColor: Colors.lightBlue.shade50,
              filled: true,
              contentPadding: EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorText: signUpProvider.yob.error,
            ),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              signUpProvider.changeYob(value);
            },
            focusNode: signUpProvider.yobFocusNode,
            controller: signUpProvider.yobController,
            onEditingComplete: () {
              signUpProvider.changeFocus(context, "yob");
            }),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.add_location_alt_sharp),
            suffixIcon: signUpProvider.textAddressController.isNotEmpty
                ? IconButton(
                    onPressed: () => signUpProvider.clearAddressController(),
                    icon: Icon(Icons.close))
                : null,
            labelText: "Address",
            fillColor: Colors.lightBlue.shade50,
            filled: true,
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText: signUpProvider.address.error,
          ),
          keyboardType: TextInputType.streetAddress,
          onChanged: (String value) {
            signUpProvider.changeAddress(value);
          },
          focusNode: signUpProvider.addressFocusNode,
          controller: signUpProvider.addressController,
          onEditingComplete: () {
            signUpProvider.changeFocus(context, "address");
          },
        ),
      ],
    );
  }

  Container _buildSignUp(
      size, BuildContext context, SignUpProvider signUpProvider) {
    return Container(
      child: ElevatedButtonCustom(
        onPressed: () {
          signUpProvider.submitData(context);
        },
        color: kButtonColor,
        borderRadius: 10,
        height: size.height * 0.06,
        width: size.width,
        child: Text(
          'Create Account',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
