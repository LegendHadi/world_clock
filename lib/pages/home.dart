import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WorldTime data;
  bool isInit = true;

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      data = ModalRoute.of(context)?.settings.arguments as WorldTime;
      isInit = false;
    }

    String bgImage = data.isDaytime ? 'day.jfif' : 'night.jfif';
    Color? bgColor = data.isDaytime ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  WorldTime? result =
                      await Navigator.pushNamed(context, '/location')
                          as WorldTime?;
                  if (result != null) {
                    setState(() {
                      data = result;
                    });
                  }
                },
                icon: const Icon(Icons.edit_location),
                label: const Text('Edit Location'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  elevation: WidgetStateProperty.all(0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.location,
                    style: const TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data.time,
                style: const TextStyle(
                  fontSize: 60,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
