import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:version1/model/verify_request.dart';

class OtpVerifyPage extends StatefulWidget {
  final String? mobileNo;
  final String? otpHash;

  const OtpVerifyPage({Key? key, this.mobileNo, this.otpHash})
      : super(key: key);

  @override
  _OtpVerifyPageState createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  String _otpCode = "";
  final int _otpCodeLength = 4;
  bool isAPICallProcess = false;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    SmsAutoFill().listenForCode.call();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          key: UniqueKey(),
          child: verifyOtpUI(),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }

  Widget verifyOtpUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/deliver2.png",
            height: 350,
            fit: BoxFit.contain,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "OTP Verification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Enter OTP to Sign In your account\n+91-${widget.mobileNo}",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: PinFieldAutoFill(
              decoration: UnderlineDecoration(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(
                  Colors.black.withOpacity(0.3),
                ),
              ),
              currentCode: _otpCode,
              codeLength: _otpCodeLength,
              onCodeChanged: (code) {
                if (code!.length == _otpCodeLength) {
                  _otpCode = code;
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: FormHelper.submitButton(
                "Verify",
                () {
                  setState(() {
                    isAPICallProcess = true;
                  });
                  VerifyRequest.verifyOTP(
                          widget.mobileNo!, widget.otpHash!, _otpCode)
                      .then(
                    (response) {
                      setState(() {
                        isAPICallProcess = false;
                      });
                      print(response.mention);
                      print(response.message);

                      if (response.message != null) {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          "Alert",
                          response.mention!,
                          "OK",
                          () {},
                        );
                      }
                    },
                  );
                },
                txtColor: Colors.black,
                prefixIcon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                width: double.infinity,
                height: 45,
                borderColor: const Color(0xffffc20c),
                btnColor: const Color(0xffffc20c),
                borderRadius: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
