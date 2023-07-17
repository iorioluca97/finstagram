import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? deviceHeight, deviceWidth;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _loginForm(),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "Finstagram",
      style: TextStyle(
        color: Colors.black,
        fontSize: 35,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: deviceWidth! * 0.70,
      height: deviceHeight! * 0.06,
      color: Colors.purple,
      child: const Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: deviceHeight! * 0.20,
      child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_emailTextField(), _passwordTextField()],
          )),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      validator: (value) {
        bool result = value!.contains(
          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
        );
        result ? null : "Please enter a valid email";
      },
      decoration: const InputDecoration(hintText: "Email"),
      onSaved: (value) {
        setState(() {
          email = value;
        });
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      validator: (value) =>
          value!.length > 6 ? null : "Please enter a valid password",
      decoration: const InputDecoration(hintText: "Password"),
      onSaved: (value) {
        setState(() {
          email = value;
        });
      },
    );
  }
}
