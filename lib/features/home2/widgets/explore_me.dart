import 'package:flutter/material.dart';

import '../../../core/const/color.dart';

class ExploreMore extends StatelessWidget {
  final String title;
  const ExploreMore({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 216, 214, 243),
          ),
          child: Text(
            "Explore more",
            style: TextStyle(color: ColorApp.mainColor),
          ),
        ),
      ],
    );
  }
}
