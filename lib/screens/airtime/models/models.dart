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

import 'dart:convert';

AirtimePurchaseModel airtimePurchaseModelFromJson(String x) => AirtimePurchaseModel.fromJson(json.decode(x));
String airtimePurchaseModelToJson(AirtimePurchaseModel data) => json.encode(data.toJson());

class AirtimePurchaseModel {
  String? status;
  Data? data;

  AirtimePurchaseModel({this.status, this.data});

  AirtimePurchaseModel.fromJson(Map<String, dynamic> json) {
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
    response = json['response'] ?? 'N/A';
    detail = json['detail'];
    requestId = json['request_id'] ?? 'N/A';
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
    data['id'] = this.id;
    data['response'] = this.response;
    data['detail'] = this.detail;
    data['request_id'] = this.requestId;
    data['date_and_time'] = this.dateAndTime;
    data['old_balance'] = this.oldBalance;
    data['new_balance'] = this.newBalance;
    data['phone_number'] = this.phoneNumber;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['type'] = this.type;
    return data;
  }
}
