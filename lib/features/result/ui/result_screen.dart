import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ResultScreen extends Screen {
  ResultScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'SEARCH RESULT',
          key: Key('CAappBarName'),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Center(
                child: Text(
              'Welcome John Doe',
              style: TextStyle(fontSize: 18),
            )),
          ),
        ],
      ),
    );
  }
}
