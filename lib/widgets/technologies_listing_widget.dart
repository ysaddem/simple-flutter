import 'package:engage_day/models/technology.dart';
import 'package:engage_day/widgets/technology_card.dart';
import 'package:flutter/material.dart';

class TechnologiesListingWidgets extends StatelessWidget {
  final List<Technology> technologies;

  const TechnologiesListingWidgets({@required this.technologies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: technologies.length,
        itemBuilder: (context, index) =>
            TechnologyCard(technology: technologies[index]));
  }
}
