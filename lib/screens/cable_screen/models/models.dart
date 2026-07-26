// [
//   {
//     "id": "777c1a07-6fbd-4bd0-90e9-a70cbf08b366",
//     "cable_service": "DStv Yanga + ExtraView",
//     "amount": 14250.0,
//     "provider": "DSTV",
//     "plan_id": 89
//   }
// ]

import 'dart:convert';

CableModel cableModelFromJson(String x) => CableModel.fromJson(json.decode(x));

class CableModel {
  final String id;
  final String cableService;
  final double amount;
  final String provider;
  final int planId;

  CableModel({
    required this.id,
    required this.cableService,
    required this.amount,
    required this.provider,
    required this.planId,
  });

  factory CableModel.fromJson(Map<String, dynamic> json) {
    return CableModel(
      id: json['id'],
      cableService: json['cable_service'],
      amount: json['amount'],
      provider: json['provider'],
      planId: json['plan_id'],
    );
  }
}

ValidationModel validationModelFromJson(String x) => ValidationModel.fromJson(json.decode(x));


class ValidationModel {
  final String status;
  final String name;
  final String message;
  final String outstandingAnount;

  ValidationModel({
    required this.status,
    required this.name,
    required this.message,
    required this.outstandingAnount,
  });

  factory ValidationModel.fromJson(Map<String, dynamic> json) {
    return ValidationModel(
      status: json['status'],
      name: json['name'],
      message: json['message'],
      outstandingAnount: json['outstandingAmount'],
    );
  }
}















// {
//   "status": "success",
//   "data": {
//     "id": "2bd0abb5-bcf9-4490-9802-7b547b0a8c05",
//     "response": "TRANSACTION SUCCESSFUL",
//     "detail": "You have purchased 100.00 airtime from MTN",
//     "request_id": "AIRTIME|ED8D3BA8-78EE-4A9C-90A4-AAC063F1A219",
//     "date_and_time": "2025-08-05T23:07:49.764458Z",
//     "old_balance": "700.00",
//     "new_balance": "600.00",
//     "phone_number": "07043194111",
//     "status": "Success",
//     "amount": "100.00",
//     "type": "Airtime"
//   }
// }


CablePurchaseModel cablePurchaseModelFromJson(String x) => CablePurchaseModel.fromJson(json.decode(x));
String cablePurchaseModelToJson(CablePurchaseModel data) => json.encode(data.toJson());

class CablePurchaseModel {
  String? status;
  Data? data;

  CablePurchaseModel({this.status, this.data});

  CablePurchaseModel.fromJson(Map<String, dynamic> json) {
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
