import 'package:flutter/material.dart';

import '../data/lists_data.dart';

class TopServices extends StatelessWidget {
  const TopServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            //height: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: topServices.length,
              itemBuilder: (context, index) {
                return topServicesItem(image: topServices[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget topServicesItem({required String image}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 17, left: 20),
    child: SizedBox(
      height: 170,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            // bottom: 20,
            child: Container(
              width: 197,
              height: 154,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 33,
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              width: 216,
              height: 123,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.asset("assets/images/Ellipse 1096 (3).png"),
                  ),
                  SizedBox(width: 12),
                  SizedBox(
                    width: 153,
                    height: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Miss Zachary Will",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Beautician",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF827BEB),
                          ),
                        ),
                        Text(
                          "Doloribus saepe aut necessit qui non qui.",
                          style: TextStyle(fontSize: 10),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_outlined,
                                    color: Colors.deepPurple,
                                    size: 12,
                                  ),
                                  SizedBox(width: 3),
                                  Text("4.9", style: TextStyle(fontSize: 8)),
                                ],
                              ),
                              SizedBox(width: 8),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF827BEB),
                                  minimumSize: Size(99, 31),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
