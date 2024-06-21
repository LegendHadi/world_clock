import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:http/http.dart';
// import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    // debugPrint('setup ${instance.isDaytime}');
    Navigator.pushReplacementNamed(context, '/home', arguments: instance
        //     arguments: {
        //   'location': instance.location,
        //   'flag': instance.flag,
        //   'time': instance.time,
        //   'isDaytime': instance.isDaytime,
        // },
        );
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
  }

  // void getTime () async {
  //   // Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //   // // print(response.body);
  //   // Map data = jsonDecode(response.body);
  //   // print(data);
  //   // print(data['title']);
  //
  //   // make the request
  //   Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //
  //   // get properties from data
  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'].substring(1,3);
  //   print(datetime);
  //   print(offset);
  //
  //   // create Datetime object
  //   DateTime now = DateTime.parse(datetime);
  //   now = now.add(Duration(hours: int.parse(offset)));
  //   print(now);
  // }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    // getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 80.0,
          ),
        ));
  }
}
