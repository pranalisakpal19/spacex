// ignore_for_file: prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:space_x_project/Repositories/SpaceLisTRepositort.dart';
import 'package:space_x_project/Screens/ListSpaceScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX Rockets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RocketsScreen(),
    );
  }
}
