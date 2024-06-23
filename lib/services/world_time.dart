import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      debugPrint(data.toString());

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      // create Datetime object
      DateTime now = DateTime.parse(datetime);
      debugPrint(now.toString());
      if (data['utc_offset'].toString().startsWith('+')) {
        now = now.add(Duration(
            hours: int.parse(offset.split(':').first),
            minutes: int.parse(offset.split(':').last)));
        // print(now);
      } else {
        now = now.subtract(Duration(
            hours: int.parse(offset.split(':').first),
            minutes: int.parse(offset.split(':').last)));
      }
      debugPrint(
          'get time 1  ${data['datetime']} / ${DateTime.parse(data['datetime'])}');
      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      debugPrint('get time $isDaytime / $time');
      // time = now.toString();
    } catch (e) {
      debugPrint('caught error: $e');
      time = 'could not get time data';
      // Navigator.pushNamed(context, '/location');
    }
  }
}
