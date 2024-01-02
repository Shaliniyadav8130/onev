import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:version1/model/login_request.dart';
import 'package:version1/screens/verify_otp_page.dart';

class LoginOTPPage extends StatefulWidget {
  const LoginOTPPage({super.key});

  @override
  State<LoginOTPPage> createState() => _LoginOTPPageState();
}

class _LoginOTPPageState extends State<LoginOTPPage> {
  String mobileNo = '';
  bool isAPICallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          key: UniqueKey(),
          child: loginUI(),
          inAsyncCall: isAPICallProcess,
          opacity: .3,
        ),
      ),
    );
  }

  loginUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/deliver2.png",
              height: 350,
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 1, right: 210, top: 10),
              child: Text(
                "Welcome 👋🏻",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 1, right: 40, top: 1),
              child: Text(
                "Enter your mobile number we will send you \nOTP to verify",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      height: 47,
                      width: 50,
                      margin: const EdgeInsets.fromLTRB(0, 10, 3, 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "+91",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: TextFormField(
                      maxLines: 1,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(6),
                        hintText: "Mobile Number",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        if (value.length > 9) {
                          mobileNo = value;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: FormHelper.submitButton(
                  "Send OTP",
                  () {
                    if (mobileNo.length > 9) {
                      setState(() {
                        isAPICallProcess = true;
                      });
                      LoginRequest.otpLogin(mobileNo).then((response) async {
                        setState(() {
                          isAPICallProcess = false;
                        });
                        print(response.message);
                        print(response.data);

                        if (response.data != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpVerifyPage(
                                  otpHash: response.data,
                                  mobileNo: mobileNo,
                                ),
                              ),
                              (route) => false);
                        }
                      });
                    }
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
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Text.rich(
                TextSpan(
                    text:
                        'By providing my phone number, I hereby agree and accept the ',
                    style: TextStyle(
                      color: Color.fromRGBO(111, 111, 111, 1),
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Terms of service ',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 194, 12, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      TextSpan(text: 'and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 194, 12, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      TextSpan(text: ' in use of the IRL app.'),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
