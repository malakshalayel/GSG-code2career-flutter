import 'package:e_commerce_design1/features/home/widgets/hero_section.dart';
import 'package:e_commerce_design1/features/home/widgets/top_rated_freelancer.dart';
import 'package:e_commerce_design1/features/home/widgets/top_services.dart';
import 'package:flutter/material.dart';

import 'widgets/best_bookings.dart';
import 'widgets/build_app_bar.dart';
import 'widgets/recommended.dart' show Recommended;
import 'widgets/section_header.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(email ?? ''),
            HeroSection(),

            SizedBox(height: 25),
            SectionHeader(title: "Top Rated Freelances", onViewAll: () {}),
            SizedBox(height: 25),

            TopRatedFreelancer(),

            SizedBox(height: 25),

            SectionHeader(title: "Top Services", onViewAll: () {}),
            SizedBox(height: 25),
            TopServices(),
            SectionHeader(title: "Best Bockings", onViewAll: () {}),
            SizedBox(height: 25),
            BestBookings(),
            SectionHeader(title: "Recommended Workshops", onViewAll: () {}),
            SizedBox(height: 25),
            Recommended(),
          ],
        ),
      ),
    );
  }
}
