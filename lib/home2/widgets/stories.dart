import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          StoryItem(
            widget: Icon(Icons.add, size: 40, weight: 1),
            nameAccount: "Your Story",
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return StoryItem(
                  widget: Image.asset(images[index]),
                  nameAccount: "christia Banm".replaceRange(10, null, '...'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List images = [
  "assets/images/Ellipse 1111.png",
  "assets/images/Ellipse 1102.png",
  "assets/images/Ellipse 1106.png",
];
Widget StoryItem({required Widget widget, required String nameAccount}) {
  return Column(
    children: [
      Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 10),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF091114),
              Color(0xFF404379),
              Color(0xFF9670F6),
              Color(0xFF91B2D4),
              Color(0xFFDEF984),
            ],
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.all(3),
          child: widget,
        ),
      ),
      Text(nameAccount),
    ],
  );
}
