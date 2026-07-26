// {
//   "status": "success",
//   "message": {
//     "id": "cbac57bd-1613-4eb3-a32e-280bb0adab92",
//     "response": "Y'ello! You have gifted 500MB to 2347043194111. Share link https://mtnapp.page.link/myMTNNGApp with 2347043194111 to download the new MyMTN app for exciting offers.. Sender number: 070****1608",
//     "detail": "You have purchased 500MB Data from MTN",
//     "request_id": null,
//     "date_and_time": "2025-08-05T23:31:27.718337Z",
//     "old_balance": "600.00",
//     "new_balance": "230.00",
//     "phone_number": "07043194111",
//     "status": "Success",
//     "amount": "370.00",
//     "type": "Data"
//   }
// }


import 'dart:convert';

DataPurchaseModel dataPurchaseModelFromJson(String x) => DataPurchaseModel.fromJson(json.decode(x));
String dataPurchaseModelToJson(DataPurchaseModel message) => json.encode(message.toJson());

class DataPurchaseModel {
  String? status;
  Data? message;

  DataPurchaseModel({this.status, this.message});

  DataPurchaseModel.fromJson(Map<String, dynamic> json) {
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
