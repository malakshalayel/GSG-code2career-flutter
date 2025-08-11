import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),

            SizedBox(height: 25),
            _buildSectionHeader(
              title: "Top Rated Freelances",
              onViewAll: () {},
            ),
            SizedBox(height: 25),

            _buildHorizontalFreelancersList(),

            SizedBox(height: 25),

            _buildSectionHeader(title: "Top Services", onViewAll: () {}),
            SizedBox(height: 25),
            _buildVerticalTopServicesSection(),
          ],
        ),
      ),
    );
  }
}

final List<String> topServices = [
  "assets/images/image 6.png",
  "assets/images/Mask group (1).png",
  "assets/images/Mask group.png",
  "assets/images/image 6.png",
];
final List<Map<String, String>> freelancersData = [
  {
    "text1": "Wade Warren",
    "text2": "Beautician",
    "image": "assets/images/freelancer1.png",
  },
  {
    "text1": "Wade Warren",
    "text2": "Beautician",
    "image": "assets/images/Ellipse 1096 (1).png",
  },
  {
    "text1": "Wade Warren",
    "text2": "Beautician",
    "image": "assets/images/Ellipse 1096 (2).png",
  },
  {
    "text1": "Wade Warren",
    "text2": "Beautician",
    "image": "assets/images/Ellipse 1096 (3).png",
  },
  {
    "text1": "Wade Warren",
    "text2": "Beautician",
    "image": "assets/images/freelancer1.png",
  },
];

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

Widget TopServices({required String image}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              // bottom: 20,
              child: Container(
                width: 205,
                height: 154,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(image: AssetImage(image)),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 33,
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                width: 225,
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
                      width: 150,
                      height: 100,
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
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_outlined,
                                    color: Colors.deepPurple,
                                    size: 15,
                                  ),
                                  SizedBox(width: 3),
                                  Text("4.9", style: TextStyle(fontSize: 8)),
                                ],
                              ),
                              SizedBox(width: 7),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF827BEB),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
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
    ),
  );
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    leading: Icon(Icons.menu),

    title: SvgPicture.asset("assets/images/logo-79.svg"),
    actions: [
      //Icon(Icons.notifications_none_outlined),
      SvgPicture.asset("assets/images/bell.svg"),
      SvgPicture.asset("assets/images/cart.svg"),
    ],
  );
}

Widget _buildHeroSection() {
  return Container(
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
      padding: EdgeInsets.only(right: 50, top: 20),
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
                        image: AssetImage("assets/images/Rectangle 30@2x.png"),
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
  );
}

Widget _buildSectionHeader({
  required String title,
  required Function onViewAll,
}) {
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

Widget _buildHorizontalFreelancersList() {
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

Widget _buildVerticalTopServicesSection() {
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
              return TopServices(image: topServices[index]);
            },
          ),
        ),
      ],
    ),
  );
}
