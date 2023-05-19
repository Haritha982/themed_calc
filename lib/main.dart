// ignore_for_file: deprecated_member_use,
import 'package:flutter/material.dart';
import 'calcUI.dart';

void main() {
  runApp(
      MaterialApp(
        home: calcUI(),
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
      ),
  );
}


