import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zyra/components/custom_modal_bottom_sheet.dart';
import 'package:zyra/constants.dart';
import 'package:zyra/control/auth/phone_auth.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool checkBoxForTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_dark.png",
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s get started!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Please enter your valid data in order to create an account.",
                  ),
                  const SizedBox(height: defaultPadding),
                  LoginForm(formKey: _formKey),
                  const SizedBox(height: defaultPadding / 4),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            checkBoxForTerms = value!;
                          });
                        },
                        value: checkBoxForTerms,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "I agree with the",
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: " Terms of service ",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "& privacy policy.",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 1.5),
                  ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        if (checkBoxForTerms) {
                          const defaultPinTheme = PinTheme(
                            width: 64,
                            height: 64,
                            textStyle: TextStyle(
                              fontSize: 22,
                              color: Color.fromRGBO(30, 60, 87, 1),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              color: Colors.black,
                            ),
                          );

                          final otpFormKey = GlobalKey<FormState>();
                          customModalBottomSheet(
                            context,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 32),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: const Icon(
                                        Icons.arrow_back,
                                        size: 32,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: defaultPadding / 2,
                                  ),
                                  Text(
                                    'Verification',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: defaultPadding / 2),
                                  const Text(
                                    "Enter your OTP",
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: defaultPadding / 2),
                                  Form(
                                    key: otpFormKey,
                                    child: Pinput(
                                      defaultPinTheme: defaultPinTheme,
                                      focusedPinTheme: defaultPinTheme.copyWith(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.red,
                                        ),
                                      ),
                                      submittedPinTheme:
                                          defaultPinTheme.copyWith(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.green,
                                        ),
                                      ),
                                      followingPinTheme:
                                          defaultPinTheme.copyWith(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      length: 4,
                                      pinputAutovalidateMode:
                                          PinputAutovalidateMode.onSubmit,
                                      onCompleted: (otp) {
                                        Navigator.pop(context);
                                        PhoneAuth.login(context, otp);
                                      },
                                    ),
                                  ),
                                  const Text(
                                    "Didn't you receive any code?",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
                                    "Resend New Code",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text("Get Started!"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
