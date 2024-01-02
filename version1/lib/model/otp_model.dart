import 'dart:convert';

OtpLoginResponseModel otpLoginResponseJSON(String str) =>
    OtpLoginResponseModel.fromJson(json.decode(str));


class OtpLoginResponseModel {
  OtpLoginResponseModel({
    required this.message,
    required this.data,
    required this.mention,
  });

  late final String? message;
  late final String? data;
  late final String? mention;

  OtpLoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['status'];
    data = json['details'];
    mention = json['message'];
  }
}
