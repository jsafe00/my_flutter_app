import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/choose_location.dart';
import 'package:my_flutter_app/pages/home.dart';
import 'package:my_flutter_app/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));
