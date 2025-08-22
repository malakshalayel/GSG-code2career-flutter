import 'package:flutter/material.dart';

class BestBookings extends StatelessWidget {
  const BestBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [_buildHeroSection(), SizedBox(height: 18), _BestBooking()],
      ),
    );
  }
}

Widget _buildHeroSection() {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFFEEF3F9),
      borderRadius: BorderRadius.circular(12),
    ),
    width: 358,
    height: 188,
    child: Stack(
      children: [
        Container(
          width: 236,
          height: 170,
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Text(
                    "Deal Of The Day",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      foreground:
                          Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2,
                    ),
                  ),
                  Text(
                    "Deal Of The Day",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                "Flat 60% OFF",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Aliquid soluta sed repellendus dignissimos culpa id. Dolorem molestias itaque neque similique.",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Text(
                    "06 : 34 :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Column(
                    children: [
                      Text(
                        " 14",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromARGB(255, 135, 134, 134),
                        ),
                      ),
                      Text(
                        " 15",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2),
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 26,
                  width: 86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(255, 41, 41, 41),
                  ),
                  child: Text(
                    "Shop Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          child: Image.asset("assets/images/fashinable.png"),
        ),
        Positioned(
          top: 5,
          right: 70,
          child: Image.asset("assets/images/_23.png"),
        ),
        Positioned(
          right: 2,
          bottom: 80,
          child: Image.asset("assets/images/_22.png"),
        ),
        Positioned(
          right: 100,
          bottom: 100,
          child: Image.asset("assets/images/_2.png"),
        ),
      ],
    ),
  );
}

Widget _buildBestBookingsItem({required String image}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    height: 260,
    child: Column(
      children: [
        Container(
          height: 180,

          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(height: 20),

        SizedBox(
          height: 60,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset("assets/images/Ellipse 1096 (1).png"),
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: 200,
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Miss Zachary Will",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: "  Beautician",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xFF827BEB),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Occaecati aut nam beatae quo non deserunt consequatur.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_outlined, color: Colors.deepPurple, size: 15),
                  SizedBox(width: 3),
                  Text("4.9", style: TextStyle(fontSize: 11)),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _BestBooking() {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: images.length,
    itemBuilder: (context, index) {
      return _buildBestBookingsItem(image: images[index]);
    },
  );
}

List<String> images = [
  "assets/images/bestbooking1.png",
  "assets/images/bestbooking2.png",
];
