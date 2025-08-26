import 'package:e_commerce_design1/screens/home/data/freelancers_model.dart';
import 'package:flutter/material.dart';

class FreelancerDetails extends StatelessWidget {
  const FreelancerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final freelancer =
        ModalRoute.of(context)!.settings.arguments as FreeLancersModel;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.asset(freelancer.img),
            Text(freelancer.name),
            Text(freelancer.job),
            Text(freelancer.rate.toString()),
          ],
        ),
      ),
    );
  }
}
