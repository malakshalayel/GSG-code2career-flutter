import 'package:e_commerce_design1/core/routes.dart';
import 'package:e_commerce_design1/screens/home/data/freelancers_model.dart';
import 'package:flutter/material.dart';

import '../data/lists_data.dart';
import 'rating.dart';

class TopRatedFreelancer extends StatelessWidget {
  TopRatedFreelancer({super.key});

  List<FreeLancersModel> freelancers = [
    FreeLancersModel(
      img: "assets/images/freelancer1.png",
      name: "Wade Warren",
      job: "Beautician",
      rate: 4.9,
    ),
    FreeLancersModel(
      img: "assets/images/freelancer1.png",
      name: "Wade Warren",
      job: "Beautician",
      rate: 4.9,
    ),
    FreeLancersModel(
      img: "assets/images/Ellipse 1096 (1).png",
      name: "Wade Warren",
      job: "Beautician",
      rate: 4.9,
    ),
    FreeLancersModel(
      img: "assets/images/Ellipse 1096 (2).png",
      name: "Wade Warren",
      job: "Beautician",
      rate: 4.9,
    ),
    FreeLancersModel(
      img: "assets/images/freelancer1.png",
      name: "Wade Warren",
      job: "Beautician",
      rate: 4.9,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152, // Fixed height for horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: freelancersData.length,
        itemBuilder: (context, index) {
          final item = freelancersData[index];
          return TopRated(freelancer: freelancers[index], context: context);
        },
      ),
    );
  }
}

Widget TopRated({required FreeLancersModel freelancer, required context}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(
        context,
        Routes.freelancerDetails,
        arguments: freelancer,
      );
    },
    child: Container(
      margin: EdgeInsets.only(left: 18),
      height: 133,
      width: 83,
      child: Stack(
        children: [
          CircleAvatar(backgroundImage: AssetImage(freelancer.img), radius: 35),
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
                    freelancer.name,
                    style: TextStyle(fontSize: 11, color: Colors.black87),
                  ),
                  Text(freelancer.job, style: TextStyle(fontSize: 11)),
                  SizedBox(height: 5),
                  Rating(rate: freelancer.rate),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
