import 'package:e_commerce_design1/core/custom_text_field.dart';
import 'package:e_commerce_design1/core/routes.dart';
import 'package:e_commerce_design1/screens/home2/home2_screen.dart';
import 'package:e_commerce_design1/screens/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

                    return "Invalid Email";
                  },
                ),
                CustomTextField(
                  hint: "password",
                  isPassword: true,
                  controller: passwordController,
                  validate: (password) {
                    if (password!.length > 8) return null;
                    return "Invalid Password";
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signup);
                  },
                  child: Text(
                    "You dont have account ?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _login(context);
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

  _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, Routes.home2);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Enter vaild Credentials'),
        ),
      );
    }
  }
}
