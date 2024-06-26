import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/choose_location.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/error.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
        '/error': (context) => const Error(),
      },
    ));
