import 'package:flutter/material.dart';
import 'package:assignment3/listpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    title: 'Assignment',
    home: ListPage(),
  ));
}