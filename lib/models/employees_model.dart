// To parse this JSON data, do
//
//     final employeesModel = employeesModelFromJson(jsonString);

import 'dart:convert';

List<EmployeesModel> employeesModelFromJson(String str) => List<EmployeesModel>.from(json.decode(str).map((x) => EmployeesModel.fromJson(x)));

String employeesModelToJson(List<EmployeesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeesModel {
    EmployeesModel({
        this.id,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.position,
        this.contractDate,
        this.myProperty,
        this.isTrainee,
        this.vacations,
    });

    int id;
    String firstName;
    String lastName;
    String birthDate;
    String position;
    String contractDate;
    int myProperty;
    bool isTrainee;
    int vacations;

    factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birthDate: json["birthDate"],
        position: json["position"],
        contractDate: json["contractDate"] == null ? null : json["contractDate"],
        myProperty: json["myProperty"],
        isTrainee: json["isTrainee"],
        vacations: json["vacations"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "birthDate": birthDate,
        "position": position,
        "contractDate": contractDate == null ? null : contractDate,
        "myProperty": myProperty,
        "isTrainee": isTrainee,
        "vacations": vacations,
    };
}
