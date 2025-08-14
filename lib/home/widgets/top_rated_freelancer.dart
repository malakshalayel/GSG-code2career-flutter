import 'package:flutter/material.dart';

import '../data/lists_data.dart';

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
            text1: item["text1"]!,
            text2: item["text2"]!,
            image: item["image"]!,
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
}) {
  return Container(
    margin: EdgeInsets.only(left: 18),
    height: 133,
    width: 83,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            color: Colors.blue,

            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(image)),
          ),
        ),
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
                Container(
                  width: 44,
                  height: 23,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 221, 243),

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_outlined,
                        color: Colors.deepPurple,
                        size: 15,
                      ),
                      SizedBox(width: 3),
                      Text("4.9", style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
