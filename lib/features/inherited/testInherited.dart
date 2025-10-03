import 'package:e_commerce_design1/features/inherited/inherited_class.dart';
import 'package:flutter/material.dart';

class TestInherited extends StatefulWidget {
  const TestInherited({super.key});

  @override
  State<TestInherited> createState() => _TestInheritedState();
}

class _TestInheritedState extends State<TestInherited> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Center(
        child: Column(
          children: [Inherited(color: randomColor(), child: ColorBox())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

Color randomColor() {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  colors.shuffle();
  return colors.first;
}

class ColorBox extends StatelessWidget {
  const ColorBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Inherited.of(context).color,
    );
  }
}
