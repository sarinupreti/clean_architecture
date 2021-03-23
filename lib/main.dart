import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'locator.dart';
import 'routes.dart';

void main() {
  logger().setLogLevel(LogLevel.verbose);

  runApp(
    CFRouterScope(
      routeGenerator: CustomRouter.generate,
      initialRoute: CustomRouter.initialRoute,
      builder: (context) => MaterialApp.router(
        routeInformationParser: CFRouteInformationParser(),
        routerDelegate: CFRouterDelegate(context),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
