import 'dart:convert';

TransactionModel transactionModelFromJson(String x) => TransactionModel.fromJson(json.decode(x));

String transactionModelToJson(TransactionModel data) => json.encode(data);

class TransactionModel {
  String? status;
  dynamic totalAmount;
  List<Data>? data;

  TransactionModel({this.status, this.totalAmount, this.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalAmount = json['total_amount'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_amount'] = this.totalAmount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? network;
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
      this.network,
      this.newBalance,
      this.phoneNumber,
      this.status,
      this.amount,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    response = json['response'];
    network = json['network'];
    detail = json['detail'];
    requestId = json['request_id'];
    dateAndTime = json['date_and_time'];
    network = json['network'];
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
    data['network'] = network;
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
