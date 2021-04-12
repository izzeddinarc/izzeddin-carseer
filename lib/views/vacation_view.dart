import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izzeddin/controllers/vacation_controller.dart';


class VacationPage extends GetView<VacationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.title,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Center(
          child: Text(
            "Vacations Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}