// To parse this JSON data, do
//
//     final vacationsModel = vacationsModelFromJson(jsonString);

import 'dart:convert';

List<VacationsModel> vacationsModelFromJson(String str) => List<VacationsModel>.from(json.decode(str).map((x) => VacationsModel.fromJson(x)));

String vacationsModelToJson(List<VacationsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VacationsModel {
    VacationsModel({
        this.id,
        this.empInfo,
        this.empId,
        this.fromDate,
        this.toDate,
        this.isApproved,
        this.rejectionReason,
    });

    int id;
    dynamic empInfo;
    int empId;
    String fromDate;
    String toDate;
    dynamic isApproved;
    dynamic rejectionReason;

    factory VacationsModel.fromJson(Map<String, dynamic> json) => VacationsModel(
        id: json["id"],
        empInfo: json["empInfo"],
        empId: json["empId"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        isApproved: json["isApproved"],
        rejectionReason: json["rejectionReason"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "empInfo": empInfo,
        "empId": empId,
        "fromDate": fromDate,
        "toDate": toDate,
        "isApproved": isApproved,
        "rejectionReason": rejectionReason,
    };
}
