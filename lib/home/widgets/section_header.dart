import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  String title;
  Function onViewAll;
  SectionHeader({super.key, required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          height: 36,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF9CB9DD), Colors.white]),
          ),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: TextButton(
            onPressed: onViewAll(),
            child: Text(
              "View All",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFF154883),
                color: Color(0xFF154883),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
