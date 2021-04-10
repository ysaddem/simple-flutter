import 'package:engage_day/models/technology.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnologyDetailsScreen extends StatefulWidget {
  final Technology technology;

  TechnologyDetailsScreen(this.technology);

  @override
  _TechnologyDetailsScreenState createState() =>
      _TechnologyDetailsScreenState();
}

class _TechnologyDetailsScreenState extends State<TechnologyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.technology.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: AssetImage(widget.technology.icon),
                  height: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("Link to documentation"),
                      Icon(Icons.launch)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Text(widget.technology.description),
              FutureBuilder(
                  future: SharedPreferences.getInstance(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      SharedPreferences prefs = snapshot.data;
                      bool isLiked =
                          prefs.getBool(widget.technology.name) ?? false;
                      return IconButton(
                          icon: isLiked
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border,
                                  color: Colors.black),
                          onPressed: () async {
                            // if (!isLiked) await addToFav(widget.technology);
                            setState(() {
                              prefs.setBool(widget.technology.name, !isLiked);
                            });
                          });
                    } else {
                      return Container();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
