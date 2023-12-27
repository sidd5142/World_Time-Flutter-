import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; // to store the location name for the UI
  late String time; // the time in that location
  late String flag; //url to asset flag icon
  String url;  // location url for endpoint
  late bool isDayTime; //true or false

  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Uri site = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
  Response response = await get(site);
  print(response.body);

  Map data = jsonDecode(response.body);
  // print(data);
  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);
  // print(datetime);

  // create Datetime object
  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));
  // time = now.toString();
      isDayTime = now.hour >6 && now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);
  }
  catch(e) {
    print('Caught Error : $e');
    time = 'Could not load error';
  }
  }
}

