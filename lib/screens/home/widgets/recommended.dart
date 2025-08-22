import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: .55,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildRecommendedItem();
        },
      ),
    );
  }
}

Widget _buildRecommendedItem() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 4,
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/recommended.png"),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      SizedBox(height: 12),
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Miss Zachary Will",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Text(
              "Beautician",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF827BEB),
              ),
            ),
            Text(
              "Occaecati aut nam beatae quo non deserunt consequatur.0",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 43, 45, 52),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              // clipBehavior: Clip.antiAlias,
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF827BEB),
                alignment: Alignment.center,
              ),
              child: Text(
                "Book Workshop",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
