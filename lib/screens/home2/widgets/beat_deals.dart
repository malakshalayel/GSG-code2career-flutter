import 'package:e_commerce_design1/screens/home/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class BeatDeals extends StatelessWidget {
  const BeatDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return beat();
        },
      ),
    );
  }
}

Widget beat() {
  return Container(
    height: 100,
    width: 264,
    margin: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: 264,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/images/bestbooking2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Nair Art",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "   \$399   ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "\$599",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Rating(rate: 4.9),
          ],
        ),
        ReadMoreText(
          'Facere necessitatibus aut sequi voluptatem totam eum veniam harum saepe '
          'voluptatem quia consectetur eveniet, repellendus illum molestiae impedit.',
          trimMode: TrimMode.Line,
          trimLines: 2,
          delimiter: '\u2026 ', // single char ellipsis + space
          trimCollapsedText: 'more',
          trimExpandedText: 'less',
          style: const TextStyle(color: Colors.black87, height: 1.35),
          moreStyle: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
          lessStyle: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
