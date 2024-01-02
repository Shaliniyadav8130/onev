import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:version1/model/config.dart';
import 'package:version1/model/otp_model.dart';

class VerifyRequest {
  static var clientverify = http.Client();

  static Future<OtpLoginResponseModel> verifyOTP(
    String mobileNo,
    String otpHash,
    String otpCode,
  ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.otpVerifyAPI);

    var response = await clientverify.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        {
          "phone": mobileNo,
          "otp": otpCode,
          "verification_key": otpHash,
        },
      ),
    );

    return otpLoginResponseJSON(response.body);
  }
}
