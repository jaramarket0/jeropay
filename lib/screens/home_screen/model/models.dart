import 'dart:convert';

DashboardModel dashboardModelFromJson(String x) => DashboardModel.fromJson(json.decode(x));


class DashboardModel {
  String? status;
  
  Data? data;

  DashboardModel({this.status, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? location;
  String? phone;
  Profile? profile;
  Wallet? wallet;
  List<Transactions>? transactions;
  dynamic walletBalance;
  List<VirtualAccounts>? virtualAccounts;

  Data(
      {
        this.name,
        this.location,
        this.profile,
        this.phone,
      this.wallet,
      this.transactions,
      this.walletBalance,
      this.virtualAccounts});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    location = json['location'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
    walletBalance = json['wallet_balance'];
    if (json['virtual_accounts'] != null) {
      virtualAccounts = <VirtualAccounts>[];
      json['virtual_accounts'].forEach((v) {
        virtualAccounts!.add(new VirtualAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['phone'] = this.phone;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    data['wallet_balance'] = this.walletBalance;
    if (this.virtualAccounts != null) {
      data['virtual_accounts'] =
          this.virtualAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  String? username;
  String? email;

  Profile({this.username, this.email});

  Profile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}

class Wallet {
  String? id;
  String? balance;
  String? gateway;
  String? commissionBalance;
  String? totalDeposit;
  String? totalPurchase;
  String? user;

  Wallet(
      {this.id,
      this.balance,
      this.gateway,
      this.commissionBalance,
      this.totalDeposit,
      this.totalPurchase,
      this.user});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    gateway = json['gateway'];
    commissionBalance = json['commission_balance'];
    totalDeposit = json['total_deposit'];
    totalPurchase = json['total_purchase'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['balance'] = this.balance;
    data['gateway'] = this.gateway;
    data['commission_balance'] = this.commissionBalance;
    data['total_deposit'] = this.totalDeposit;
    data['total_purchase'] = this.totalPurchase;
    data['user'] = this.user;
    return data;
  }
}

class Transactions {
  String? id;
  String? response;
  String? detail;
  String? network;
  String? requestId;
  String? dateAndTime;
  String? oldBalance;
  String? newBalance;
  String? phoneNumber;
  String? status;
  String? amount;
  String? type;

  Transactions(
      {this.id,
      this.response,
      this.detail,
      this.network,
      this.requestId,
      this.dateAndTime,
      this.oldBalance,
      this.newBalance,
      this.phoneNumber,
      this.status,
      this.amount,
      this.type});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    response = json['response'];
    detail = json['detail'];
    network = json['network'];
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
    data['id'] = this.id;
    data['response'] = this.response;
    data['detail'] = this.detail;
    data['network'] = this.network;
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

class VirtualAccounts {
  int? id;
  String? bankName;
  String? accountNumber;
  String? accountName;
  String? bankCode;
  String? createdAt;
  String? profile;

  VirtualAccounts(
      {this.id,
      this.bankName,
      this.accountNumber,
      this.accountName,
      this.bankCode,
      this.createdAt,
      this.profile});

  VirtualAccounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    bankCode = json['bank_code'];
    createdAt = json['created_at'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name'] = this.bankName;
    data['account_number'] = this.accountNumber;
    data['account_name'] = this.accountName;
    data['bank_code'] = this.bankCode;
    data['created_at'] = this.createdAt;
    data['profile'] = this.profile;
    return data;
  }
}
