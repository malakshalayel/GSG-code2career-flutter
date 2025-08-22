import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rate;
  const Rating({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 23,
      decoration: BoxDecoration(
        color: const Color(0xFF827BEB).withAlpha(25),

        borderRadius: BorderRadius.circular(40),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star_outlined, color: Color(0xFF827BEB), size: 15),
          SizedBox(width: 3),
          Text(rate.toStringAsFixed(1), style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
