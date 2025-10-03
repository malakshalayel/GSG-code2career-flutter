import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _count++;
                  saveData();
                });
                
              },
              icon: Icon(Icons.add),
            ),
            Text(_count.toString()),
            IconButton(
              onPressed: () {
                setState(() {
                  if (_count > 0) {
                    _count--;
                    saveData();

                  }
                });
              },
              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }

  void saveData() async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt('counter', _count);
  }

  void getData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _count = pref.getInt('counter') ?? 0;
    });
  }
}
