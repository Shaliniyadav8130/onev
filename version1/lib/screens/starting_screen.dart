import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:version1/screens/login_otp_page.dart';
import 'package:version1/widgets/custom_page_route.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/deliver1.png"),
            const Text(
              "On Demand Delivery",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            const Text(
              "lorem ipsum lorem ipsumlorem ipsumlorem\n ipsumlorem ipsumlorem ipsumlorem\n ipsumlorem ipsumlorem ipsum",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: FormHelper.submitButton(
                  "Login with Phone Number",
                  () {
                    Navigator.push(
                      context,
                      CustomPageroute(
                          child: const LoginOTPPage(),
                          direction: AxisDirection.left),
                    );
                  },
                  txtColor: Colors.black,
                  prefixIcon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  width: double.infinity,
                  height: 55,
                  borderColor: const Color(0xffffc20c),
                  btnColor: const Color(0xffffc20c),
                  borderRadius: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
