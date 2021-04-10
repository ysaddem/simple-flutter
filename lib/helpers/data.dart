import 'dart:convert';

import 'package:engage_day/helpers/api_client.dart';
import 'package:engage_day/models/technology.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Technology>> getFrameworks() async {
  String data = await rootBundle.loadString("assets/json/frameworks.json");
  List arrayOfData = jsonDecode(data);
  List<Technology> frameworks =
      arrayOfData.map<Technology>((e) => Technology.fromJson(e)).toList();
  return frameworks;
}

Future<List<Technology>> getLanguges() async {
  String data = await rootBundle.loadString("assets/json/lang.json");
  List arrayOfData = jsonDecode(data);
  List<Technology> frameworks =
      arrayOfData.map<Technology>((e) => Technology.fromJson(e)).toList();
  return frameworks;
}

Future<List<Technology>> getClouds() async {
  dynamic data = await ApiClient().getClouds();
  List arrayOfData = data;
  List<Technology> frameworks =
      arrayOfData.map<Technology>((e) => Technology.fromJson(e)).toList();
  return frameworks;
}

Future<List<Technology>> getFavs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String data = prefs.getString("fav") ?? "[]";
  List arrayOfData = jsonDecode(data);
  List<Technology> technologies =
      arrayOfData.map((e) => Technology.fromJson(e)).toList();
  return technologies;
}

Future addToFav(Technology technology) async {
  List<Technology> technologies = await getFavs();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  technologies.add(technology);
  List<Map<String, dynamic>> technologiesMap =
      technologies.map((e) => e.toJson()).toList();
  String data = jsonEncode(technologiesMap);
  prefs.setString("fav", data);
}
