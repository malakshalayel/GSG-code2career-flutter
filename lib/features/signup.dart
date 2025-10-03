import 'package:e_commerce_design1/core/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../core/routes.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://cdn-icons-png.freepik.com/512/295/295128.png",
                  height: 200,
                ),
                CustomTextField(
                  hint: "Email",
                  controller: emailController,
                  validate: (email) {
                    if (email!.contains('@') && email.contains('.')) {
                      return null;
                    }
                    return "Invaild email";
                  },
                ),
                CustomTextField(
                  hint: "password",
                  isPassword: true,
                  controller: passwordController,
                  validate: (password) {
                    if (password!.length > 6) return null;
                    return "Ivalid Password";
                  },
                ),
                CustomTextField(
                  hint: "confirm password",
                  isPassword: true,
                  controller: confirmPassController,
                  validate: (confirmPass) {
                    if (confirmPassController.text == passwordController.text &&
                        confirmPass!.isNotEmpty &&
                        confirmPass.length > 6) {
                      return null;
                    }
                    return "not match";
                  },
                ),
                CustomTextField(
                  hint: "phone number",

                  controller: phoneNumberController,
                  validate: (phonrNum) {
                    if (phoneNumberController.text.startsWith("+01")) {
                      return null;
                    }
                    return "Invaild number";
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  child: Text("You already have account ?"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _signUp(context);
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, Routes.home2);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Enter vaild Credentials')));
    }
  }
}
