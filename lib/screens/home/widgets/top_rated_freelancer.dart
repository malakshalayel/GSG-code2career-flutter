import 'package:flutter/material.dart';

import '../data/lists_data.dart';
import 'rating.dart';

class TopRatedFreelancer extends StatelessWidget {
  const TopRatedFreelancer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152, // Fixed height for horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: freelancersData.length,
        itemBuilder: (context, index) {
          final item = freelancersData[index];
          return TopRated(
            text1: item["name"]!,
            text2: item["title"]!,
            image: item["image"]!,
            rating: item["rate"]!,
          );
        },
      ),
    );
  }
}

Widget TopRated({
  required String text1,
  required String text2,
  required String image,
  required double rating,
}) {
  return Container(
    margin: EdgeInsets.only(left: 18),
    height: 133,
    width: 83,
    child: Stack(
      children: [
        CircleAvatar(backgroundImage: AssetImage(image), radius: 35),
        Positioned(
          bottom: 15,
          child: Container(
            padding: EdgeInsets.all(8),
            width: 84,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: [
                Text(
                  text1,
                  style: TextStyle(fontSize: 11, color: Colors.black87),
                ),
                Text(text2, style: TextStyle(fontSize: 11)),
                SizedBox(height: 5),
                Rating(rate: rating),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
