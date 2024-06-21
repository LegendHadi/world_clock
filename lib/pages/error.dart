import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  const Error({Key? key}) : super(key: key);

  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.warning_amber_outlined,
              color: Colors.amber,
              size: 50,
            ),
            Text('Error'),
          ],
        ),
      ),
    );
  }
}
