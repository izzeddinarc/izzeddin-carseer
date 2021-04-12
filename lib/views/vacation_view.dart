import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izzeddin/controllers/vacation_controller.dart';


class VacationPage extends GetView<VacationsController> {
  VacationsController _vacationsController=Get.find();
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
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Obx(() {
              if (_vacationsController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return _vacationsController.employeesList.isEmpty
                    ? Center(
                        child: Wrap(
                          children: [
                            Text(
                              "No available Vacations to show",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 25,
                              ),
                            )
                          ],
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 7),
                        ),
                        itemCount: _vacationsController.employeesList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.person,color: Colors.grey),
                                        SizedBox(width:5),
                                        Text(_vacationsController.employeesList[index].id.toString(),
                                        style: TextStyle(fontSize: 18),)
                                      ],),
                                      SizedBox(height:20),
                                      Row(children: [
                                        Icon(Icons.calendar_today_rounded,color: Colors.grey),
                                        SizedBox(width:5),
                                        Text("${_vacationsController.employeesList[index].fromDate} - ${_vacationsController.employeesList[index].toDate}",
                                        style: TextStyle(fontSize: 18),)
                                      ],),
                                     
                                    ],
                                  ),
                                )),
                          );
                        },
                      );
            }),
          )
        ]),
      ),
    );
  }
}