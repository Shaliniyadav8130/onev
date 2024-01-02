import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:version1/model/config.dart';
import 'package:version1/model/otp_model.dart';

class LoginRequest {
  static var client = http.Client();

  static Future<OtpLoginResponseModel> otpLogin(String mobileNo) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.otpLoginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"number": mobileNo}),
    );

    return otpLoginResponseJSON(response.body);
  }
}
