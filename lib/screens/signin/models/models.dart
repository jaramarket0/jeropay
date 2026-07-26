// {
//   "status": "success",
//   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzU4MTQ4Nzc3LCJpYXQiOjE3NTQ1NDg3NzcsImp0aSI6ImNlZGJkN2I3MDRmYzRmZWQ4OTNjZmYxYjhjYThhYjhiIiwidXNlcl9pZCI6Nn0.rf6UJgdeI4MksrmO43KHv1UQEJNYluzmvo5jnKIUwbY",
//   "user_id": 6,
//   "username": "desthos0",
//   "accounts": [
//     {
//       "id": 1,
//       "bank_name": "PalmPay",
//       "account_number": "6674816031",
//       "account_name": "BillStack/JPay-DANIEL",
//       "bank_code": "PALMPAY",
//       "created_at": "2025-08-05T17:20:59.486194Z",
//       "profile": "9e852db8-4cbc-4864-805b-133afd083954"
//     },
//     {
//       "id": 2,
//       "bank_name": "9PSB Bank",
//       "account_number": "5764071538",
//       "account_name": "JPay-DANIEL MKPOIKANA EKWERE",
//       "bank_code": "9PSB",
//       "created_at": "2025-08-05T17:21:05.744743Z",
//       "profile": "9e852db8-4cbc-4864-805b-133afd083954"
//     },
//     {
//       "id": 3,
//       "bank_name": "SafeHaven Bank",
//       "account_number": "6028789629",
//       "account_name": "JPay-DANIEL MKPOIKANA EKWERE",
//       "bank_code": "SAFEHAVEN",
//       "created_at": "2025-08-05T17:21:11.801746Z",
//       "profile": "9e852db8-4cbc-4864-805b-133afd083954"
//     },
//     {
//       "id": 4,
//       "bank_name": "PalmPay",
//       "account_number": "6651262175",
//       "account_name": "BillStack/JPay-DANIEL",
//       "bank_code": "PALMPAY",
//       "created_at": "2025-08-06T17:33:18.900035Z",
//       "profile": "63d68545-10ba-4636-820d-7f0c51ba9647"
//     },
//     {
//       "id": 5,
//       "bank_name": "9PSB Bank",
//       "account_number": "5764107039",
//       "account_name": "JPay-DANIEL MKPOIKANA EKWERE",
//       "bank_code": "9PSB",
//       "created_at": "2025-08-06T17:33:25.003969Z",
//       "profile": "63d68545-10ba-4636-820d-7f0c51ba9647"
//     },
//     {
//       "id": 6,
//       "bank_name": "SafeHaven Bank",
//       "account_number": "6028967220",
//       "account_name": "JPay-DANIEL MKPOIKANA EKWERE",
//       "bank_code": "SAFEHAVEN",
//       "created_at": "2025-08-06T17:33:31.167736Z",
//       "profile": "63d68545-10ba-4636-820d-7f0c51ba9647"
//     },
//     {
//       "id": 7,
//       "bank_name": "PalmPay",
//       "account_number": "6694887609",
//       "account_name": "BillStack/JPay-Desmond",
//       "bank_code": "PALMPAY",
//       "created_at": "2025-08-06T18:47:00.945837Z",
//       "profile": "d815db0b-7749-4fcb-8e55-7186760c8b34"
//     },
//     {
//       "id": 8,
//       "bank_name": "9PSB Bank",
//       "account_number": "5764109222",
//       "account_name": "JPay-Desmond thedore jude",
//       "bank_code": "9PSB",
//       "created_at": "2025-08-06T18:47:07.986642Z",
//       "profile": "d815db0b-7749-4fcb-8e55-7186760c8b34"
//     },
//     {
//       "id": 9,
//       "bank_name": "SafeHaven Bank",
//       "account_number": "6026310539",
//       "account_name": "JPay-Desmond thedore jude",
//       "bank_code": "SAFEHAVEN",
//       "created_at": "2025-08-06T18:47:13.989565Z",
//       "profile": "d815db0b-7749-4fcb-8e55-7186760c8b34"
//     }
//   ],
//   "profile": {
//     "location": "uyo aks.",
//     "phone": "08054123456",
//     "state": "",
//     "fullName": "Desmond thedore jude",
//     "profile_picture": null,
//     "recommended_by": null,
//     "code": "desthos0"
//   },
//   "pin": {
//     "pin": "25250"
//   }
// }

import 'dart:convert';

SigninModel signinModelFromJson(String x) => SigninModel.fromJson(json.decode(x));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());


class SigninModel {
  String? status;
  String? token;
  int? userId;
  String? username;
  List<Accounts>? accounts;
  Profile? profile;
  Pin? pin;

  SigninModel(
      {this.status,
      this.token,
      this.userId,
      this.username,
      this.accounts,
      this.profile,
      this.pin});

  SigninModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    userId = json['user_id'];
    username = json['username'];
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(new Accounts.fromJson(v));
      });
    }
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    pin = json['pin'] != null ? new Pin.fromJson(json['pin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.pin != null) {
      data['pin'] = this.pin!.toJson();
    }
    return data;
  }
}

class Accounts {
  int? id;
  String? bankName;
  String? accountNumber;
  String? accountName;
  String? bankCode;
  String? createdAt;
  String? profile;

  Accounts(
      {this.id,
      this.bankName,
      this.accountNumber,
      this.accountName,
      this.bankCode,
      this.createdAt,
      this.profile});

  Accounts.fromJson(Map<String, dynamic> json) {
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

class Profile {
  String? location;
  String? phone;
  String? state;
  String? fullName;
  String? profilePicture;
  String? recommendedBy;
  String? code;

  Profile(
      {this.location,
      this.phone,
      this.state,
      this.fullName,
      this.profilePicture,
      this.recommendedBy,
      this.code});

  Profile.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    phone = json['phone'];
    state = json['state'];
    fullName = json['fullName'];
    profilePicture = json['profile_picture'];
    recommendedBy = json['recommended_by'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['location'] = location;
    data['phone'] = phone;
    data['state'] = state;
    data['fullName'] = fullName;
    data['profile_picture'] = profilePicture;
    data['recommended_by'] = recommendedBy;
    data['code'] = code;
    return data;
  }
}

class Pin {
  String? pin;

  Pin({this.pin});

  Pin.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pin'] = pin;
    return data;
  }
}
