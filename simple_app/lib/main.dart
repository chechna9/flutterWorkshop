import 'package:flutter/material.dart';
import 'package:simple_app/home.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Home(),
      ),
    ),
  );
}
