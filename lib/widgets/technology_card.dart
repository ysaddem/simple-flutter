import 'package:engage_day/models/technology.dart';
import 'package:engage_day/screens/technology_details_screen.dart';
import 'package:flutter/material.dart';

class TechnologyCard extends StatelessWidget {
  final Technology technology;

  TechnologyCard({@required this.technology});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TechnologyDetailsScreen(technology)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 5, left: 10, right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1.0, 1.0),
                  color: Colors.grey.withOpacity(0.6),
                  blurRadius: 7),
            ]),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(technology.icon),
                  )),
            ),
            SizedBox(
              width: 5,
            ),
            Text(technology.name)
          ],
        ),
      ),
    );
  }
}
