import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../presentation/task/home_screen.dart';
import 'my_app.dart';

void main() {
  FluroRouter.appRouter.define(
    '/',
    handler: Handler(
      handlerFunc: (context, params) => HomeScreen.create(context!),
    ),
  );

  runApp(const MyApp());
}
