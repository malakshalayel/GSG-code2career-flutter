import 'package:e_commerce_design1/screens/login.dart';
import 'package:flutter/material.dart';

import '../../core/routes.dart';
import '../../core/share_widgets/search_text_field.dart';
import 'widgets/beat_deals.dart';
import 'widgets/explore_me.dart';
import 'widgets/stories.dart';

class Home2Screen extends StatelessWidget {
  const Home2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo-79.png"),
        actions: [
          Image.asset("assets/images/heart.png"),
          Image.asset("assets/images/notification.png"),
          Image.asset("assets/images/cart.png"),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.login);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextField(),
            SizedBox(height: 10),
            Stories(),
            SizedBox(height: 30),

            ExploreMore(title: "Beat Deals For You"),
            SizedBox(height: 15),
            Image.asset(
              "assets/images/13444237_5251548 1.png",
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            SizedBox(height: 10),

            BeatDeals(),
            //SizedBox(height: 10),
            ExploreMore(title: "Trending workshops"),
          ],
        ),
      ),
    );
  }
}
