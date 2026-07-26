
import 'dart:convert';

ElectricityPurchaseModel electricityPurchaseModelFromJson(String x) => ElectricityPurchaseModel.fromJson(json.decode(x));
String electricityPurchaseModelToJson(ElectricityPurchaseModel data) => json.encode(data.toJson());

class ElectricityPurchaseModel {
  String? status;
  Data? data;

  ElectricityPurchaseModel({this.status, this.data});

  ElectricityPurchaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? response;
  String? detail;
  String? requestId;
  String? dateAndTime;
  String? oldBalance;
  String? newBalance;
  String? phoneNumber;
  String? status;
  String? amount;
  String? type;

  Data(
      {this.id,
      this.response,
      this.detail,
      this.requestId,
      this.dateAndTime,
      this.oldBalance,
      this.newBalance,
      this.phoneNumber,
      this.status,
      this.amount,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    response = json['response'];
    detail = json['detail'];
    requestId = json['request_id'];
    dateAndTime = json['date_and_time'];
    oldBalance = json['old_balance'];
    newBalance = json['new_balance'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    amount = json['amount'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['response'] = response;
    data['detail'] = detail;
    data['request_id'] = requestId;
    data['date_and_time'] = dateAndTime;
    data['old_balance'] = oldBalance;
    data['new_balance'] = newBalance;
    data['phone_number'] = phoneNumber;
    data['status'] = status;
    data['amount'] = amount;
    data['type'] = type;
    return data;
  }
}




ValidationModel validationModelFromJson(String x) => ValidationModel.fromJson(json.decode(x));


class ValidationModel {
  final String status;
  final String name;
  final String message;
  final String customerAddress;
  final String outstandingAnount;

  ValidationModel({
    required this.status,
    required this.name,
    required this.message,
    required this.customerAddress,
    required this.outstandingAnount,
  });

  factory ValidationModel.fromJson(Map<String, dynamic> json) {
    return ValidationModel(
      status: json['status'],
      name: json['name'],
      message: json['message'],
      customerAddress :json['customer_address'],
      outstandingAnount: json['outstandingAmount'],
    );
  }
}

