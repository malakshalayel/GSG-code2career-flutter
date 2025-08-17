import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.format_align_left_sharp),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 203,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.white, Color(0xFF9CB9DD)],
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(right: 20, top: 13),
            // width: 250,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: Container(
                    //alignment: Alignment.topLeft,
                    width: 217,
                    height: 162,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Text(
                              "Todays Deal",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                foreground:
                                    Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2,
                              ),
                            ),
                            Text(
                              "Todays Deal",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "50% OFF",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: Color(0xFF5C6F81),
                            wordSpacing: 1.5,
                            height: 1.5,
                          ),
                          "Et provident eos est dolore. Eum libero eligendi molestias aut et quibusdam aspernatur.",
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 107,
                          height: 26,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/Rectangle 30@2x.png",
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "BUY IT NOW",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(width: 3),
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  right: -20,
                  child: Image.asset(
                    'assets/images/image 4.png',
                    fit: BoxFit.cover, // fill height, crop if needed
                    //height: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
