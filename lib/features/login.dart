import 'package:e_commerce_design1/core/custom_text_field.dart';
import 'package:e_commerce_design1/core/routes.dart';
import 'package:e_commerce_design1/features/home/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
  static const String userCredentialsKey = 'user_credentials';
}

class _LoginState extends State<Login> {
  late String name;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

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
                  child:
                      isLoading ? CircularProgressIndicator() : Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
    name = emailController.text;
    if (_formKey.currentState!.validate()) {
      loginUser(emailController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(email: emailController.text),
        ),
      );
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

loginUser(String email) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString(Login.userCredentialsKey, email);
}
