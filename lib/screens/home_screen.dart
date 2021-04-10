import 'package:engage_day/helpers/data.dart';
import 'package:engage_day/widgets/technologies_listing_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _FrameworksWidget() {
    return FutureBuilder(
        future: getFrameworks(),
        builder: (context, snaphot) {
          if (snaphot.hasData) {
            return TechnologiesListingWidgets(technologies: snaphot.data);
          } else {
            return Container();
          }
        });
  }

  Widget LanguagesWidgets() {
    return FutureBuilder(
        future: getLanguges(),
        builder: (context, snaphot) {
          if (snaphot.hasData) {
            return TechnologiesListingWidgets(technologies: snaphot.data);
          } else {
            return Container();
          }
        });
  }

  Widget CloudWidgets() {
    return FutureBuilder(
        future: getClouds(),
        builder: (context, snaphot) {
          if (snaphot.hasData) {
            return TechnologiesListingWidgets(technologies: snaphot.data);
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tech App"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Frameworks"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Languges"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Clouds"),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          _FrameworksWidget(),
          LanguagesWidgets(),
          CloudWidgets(),
        ],
      ),
    );
  }
}
