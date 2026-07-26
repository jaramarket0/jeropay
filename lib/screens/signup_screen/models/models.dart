// {
//   "status": "success",
//   "data": {
//     "username": "DANIEL_EKWERE1",
//     "email": "dme0@gmail.com"
//   },
//   "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzU4MTAxNjEyLCJpYXQiOjE3NTQ1MDE2MTIsImp0aSI6ImJhZmEyNTUzNTYxYTQ4ZDg5OThkMmJhZDVhNmEwNzIxIiwidXNlcl9pZCI6M30._uiZuDNBKn7MENFMbBUOex4LdL74PX6Y-V9XA2Y5oTQ"
// }

import 'dart:convert';

RegisterUser registerUserFromJson(String x) => RegisterUser.fromJson(json.decode(x));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  final String? status;
  final Data? data;
  final String? accessToken;

  RegisterUser({this.status, this.data, this.accessToken});

  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      status: json['status'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'access_token': accessToken,
    };
  }
}

class Data {
  final String? username;
  final String? email;

  Data({this.username, this.email});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }
}
