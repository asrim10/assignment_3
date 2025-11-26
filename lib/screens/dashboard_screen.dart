import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard Screen",
        style:TextStyle(
          color: Colors.greenAccent,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Times New Roman",
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}