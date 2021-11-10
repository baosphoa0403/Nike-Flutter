import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nike_project/common/Button/elevated_button_custom.dart';
import 'package:nike_project/common/ScocialButton/social_button.dart';
import 'package:nike_project/page/SignUp/button_back.dart';
import 'package:nike_project/page/SignUp/validation_email_password.dart';

enum ButtonState { init, loading, done }

class SignInBody extends StatefulWidget with EmailAndPasswordValidator {
  SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String email = "";
  final FocusNode _emailFocusNode = FocusNode();
  String password = "";
  final FocusNode _passwordFocusNode = FocusNode();
  bool _submitted = false;
  bool isPasswordVisible = true;
  bool isLoading = true;

  ButtonState state = ButtonState.init;

  void _submit() async {
    setState(() => _submitted = true);
    if (_key.currentState!.validate()) {
      setState(() {
        state = ButtonState.loading;
      });
      await Future.delayed(const Duration(seconds: 3));
      print("email: " + email + "-password: " + password);
      setState(() {
        state = ButtonState.done;
        _submitted = false;
      });
      _emailController.clear();
      _passwordController.clear();
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        state = ButtonState.init;
      });
    }
  }

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.green : Colors.blueAccent.shade400;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isDone
            ? const Icon(
                Icons.done,
                size: 52,
                color: Colors.white,
              )
            : const CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
      ),
    );
  }

  ListView buildButtonLogin() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        ElevatedButtonCustom(
            width: MediaQuery.of(context).size.width,
            borderRadius: 10,
            child: const Text("Login In"),
            color: Colors.blueAccent.shade400,
            height: MediaQuery.of(context).size.height * 0.06,
            onPressed: _submit),
        const SizedBox(
          height: 20,
        ),
        SocialSignInButton(
          width: MediaQuery.of(context).size.height * 0.6,
          text: "Sign In With Google",
          color: Colors.white,
          textColor: Colors.black,
          onPressed: () {},
          borderRadius: 10.0,
          height: MediaQuery.of(context).size.height * 0.06,
          assertName: 'assets/google-48.png',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(email);
    final bool isDone = state == ButtonState.done;
    final bool isStretched = state == ButtonState.init;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const ButtonBack(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            // Lottie.asset(
            //   "assets/71361-sign-in.json",
            //   width: MediaQuery.of(context).size.width * 0.5,
            // ),
            Text(
              "Sign In\nAccount",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                // backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        _buildForm(),
        isStretched ? buildButtonLogin() : buildSmallButton(isDone)
      ],
    );
  }

  Form _buildForm() {
    return Form(
        key: _key,
        child: Column(
          children: <Widget>[
            _buildTextFieldEmail(),
            const SizedBox(
              height: 50,
            ),
            _buildTextFieldPassword(),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  String? validateEmail(String? value) {
    if (widget.emailValidator.isStringEmpty(value!)) {
      return widget.invalidEmailErrorText;
    }
    if (!widget.emailValidator.isEmailValid(value)) {
      return widget.invalidEmailInValidFormat;
    }
    return null;
  }

  TextFormField _buildTextFieldEmail() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        suffixIcon: _emailController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => _emailController.clear(),
              )
            : null,
        filled: true,
        fillColor: Colors.blue[50],
        hintText: "Email",
        contentPadding: const EdgeInsets.all(20),
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      autovalidateMode: _submitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      validator: validateEmail,
      controller: _emailController,
      onChanged: (text) {
        // print("abc");
        setState(() => {email = text});
      },
      autocorrect: false, // gợi ý
      keyboardType: TextInputType.emailAddress, // have email
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      enabled: _submitted ? false : true,
      onEditingComplete: () {
        final newFocus =
            validateEmail(email) == null // check có cho chuyển forcus ko
                ? _passwordFocusNode
                : _emailFocusNode;
        FocusScope.of(context).requestFocus(newFocus);
      },
    );
  }

  String? validatePassword(String? value) {
    if (widget.passValidator.isStringEmpty(value!)) {
      return widget.invalidPassErrorText;
    }
    return null;
  }

  TextFormField _buildTextFieldPassword() {
    return TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.password_outlined),
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () => {
              setState(() => {isPasswordVisible = !isPasswordVisible})
            },
          ),
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.blue[50],
          labelText: "Password",
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        autovalidateMode: _submitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        onChanged: (text) => setState(() => {password = text}),
        validator: validatePassword,
        obscureText: isPasswordVisible,
        textInputAction: TextInputAction.done,
        enabled: _submitted ? false : true,
        focusNode: _passwordFocusNode,
        controller: _passwordController,
        onEditingComplete: () => _submit());
  }
}
