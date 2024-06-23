import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Kabul', flag: 'AFGHANISTAN.jfif', url: 'Asia/Kabul'),
    WorldTime(
        location: 'Melbourne',
        flag: 'AUSTRALIA.jfif',
        url: 'Australia/Melbourne'),
    WorldTime(location: 'Jakarta', flag: 'INDONESIA.jfif', url: 'Asia/Jakarta'),
    WorldTime(location: 'Seoul', flag: 'SOUTH KOREA.jfif', url: 'Asia/Seoul'),
    WorldTime(location: 'Tehran', flag: 'IRAN.jfif', url: 'Asia/Tehran'),
    WorldTime(location: 'Toronto', flag: 'CANADA.jfif', url: 'America/Toronto'),
    WorldTime(
        location: 'Istanbul', flag: 'TURKEY.jfif', url: 'Europe/Istanbul'),
    WorldTime(location: 'London', flag: 'UK.jpg', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'GERMANY.jfif', url: 'Europe/Berlin'),
    WorldTime(location: 'New York', flag: 'USA.jpg', url: 'America/New_York'),
    WorldTime(
        location: 'Los_Angeles', flag: 'USA.jpg', url: 'America/Los_Angeles'),
    WorldTime(
        location: 'Sao_Paulo', flag: 'BRAZIL.jfif', url: 'America/Sao_Paulo'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: Card(
              color: Colors.tealAccent[100],
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
