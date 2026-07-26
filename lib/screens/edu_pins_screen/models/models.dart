import 'dart:convert';

EduPinPurchaseModel eduPinPurchaseModelFromJson(String x) => EduPinPurchaseModel.fromJson(json.decode(x));
String eduPinPurchaseModelToJson(EduPinPurchaseModel message) => json.encode(message.toJson());

class EduPinPurchaseModel {
  String? status;
  Data? message;

  EduPinPurchaseModel({this.status, this.message});

  EduPinPurchaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'] != null ? new Data.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> message = new Map<String, dynamic>();
    message['status'] = this.status;
    if (this.message != null) {
      message['message'] = this.message!.toJson();
    }
    return message;
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
    final Map<String, dynamic> message = new Map<String, dynamic>();
    message['id'] = id;
    message['response'] = response;
    message['detail'] = detail;
    message['request_id'] = requestId;
    message['date_and_time'] = dateAndTime;
    message['old_balance'] = oldBalance;
    message['new_balance'] = newBalance;
    message['phone_number'] = phoneNumber;
    message['status'] = status;
    message['amount'] = amount;
    message['type'] = type;
    return message;
  }
}