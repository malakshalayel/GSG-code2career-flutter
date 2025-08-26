import 'package:e_commerce_design1/core/routes.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

int index = 0;
List<Widget> screens = [Text("Home"), Text("cart"), Text("settings")];

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey[100],
        child: Column(
          children: [
            ListTile(
              title: Text("Login"),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
            ),
            ListTile(
              title: Text("Sign Up"),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.signup);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text("Main App")),
      body: Center(child: screens[index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_2_outlined),
            label: "Cart",
            activeIcon: Icon(Icons.shop_2),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            activeIcon: Icon(Icons.settings_cell_outlined),
          ),
        ],
      ),
    );
  }
}
