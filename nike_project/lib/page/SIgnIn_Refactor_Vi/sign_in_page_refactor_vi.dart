import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/common/Button/elevated_button_custom.dart';
import 'package:nike_project/view_models/sign_up_validation.dart';
import 'package:provider/provider.dart';

class SignInStateVi extends StatefulWidget {
  const SignInStateVi({Key? key}) : super(key: key);

  @override
  _SignInStateViState createState() => _SignInStateViState();
}

class _SignInStateViState extends State<SignInStateVi> {
  bool checkedValue = false;
  bool newValue = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
            body: Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildLogo(),
            _buildTextSignIn(),
            _buildTextFieldEmail(),
            _buildTextFieldPassword(),
            _buildCheckboxRememberMe(size),
            _buildTextForgetPassword(),
            _buildButtonSignIn(size, context)
          ],
        ),
      ),
    )));
  }

  Container _buildLogo() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xffd8d8d8)),
          child: const FlutterLogo(),
        ),
      ),
    );
  }

  Row _buildTextSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text("Sign In Account",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              fontSize: 30,
            ))
      ],
    );
  }

  Padding _buildTextForgetPassword() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
      child: Text("Forget password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            fontSize: 12,
          )),
    );
  }

  SizedBox _buildCheckboxRememberMe(Size size) {
    return SizedBox(
      width: size.width,
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.only(left: 0),
        title: const Text("Remember me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              fontSize: 12,
            )),
        value: checkedValue,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue!;
          });
        },
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }

  Center _buildButtonSignIn(Size size, BuildContext context) {
    final validationProvider = Provider.of<SignUpValidationProvider>(context);
    return Center(
      child: ElevatedButtonCustom(
          width: size.width,
          borderRadius: 10,
          child: const Text("SIGN IN"),
          color: Colors.blueAccent.shade400,
          height: MediaQuery.of(context).size.height * 0.06,
          onPressed: () {}),
    );
  }

  Container _buildTextFieldPassword() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Stack(
        alignment:
            AlignmentDirectional.centerEnd, //element child sẽ nằm dưới màn hình
        children: <Widget>[
          TextField(
            obscureText: isVisible, //pw hiden
            style: const TextStyle(fontSize: 15, color: Colors.black),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
                labelText: "Password",
                labelStyle:
                    const TextStyle(color: Color(0xff888888), fontSize: 15)),
          ),
        ],
      ),
    );
  }

  Container _buildTextFieldEmail() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: const TextField(
        style: TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
            labelText: "Email",
            labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15)),
      ),
    );
  }
}
