import 'package:clean_architecture_example/features/result/ui/result_screen.dart';
import 'package:clean_architecture_example/features/search/ui/search_screen.dart';
import 'package:flutter/material.dart';

abstract class CustomRouter {
  static const String initialRoute = '/';
  static const String resultRoute = '/result';

  static Widget generate(String name) {
    switch (name) {
      case initialRoute:
        return SearchScreen();

      case resultRoute:
        return ResultScreen();

      default:
        return PageNotFound();
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Text('404, Page Not Found!',
                style: TextStyle(color: Colors.black))));
  }
}
