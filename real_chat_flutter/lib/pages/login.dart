// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_chat_flutter/components/custom_button.dart';
import 'package:real_chat_flutter/components/custom_card.dart';
import 'package:real_chat_flutter/components/custom_input.dart';
import 'package:real_chat_flutter/components/custom_text.dart';
import 'package:real_chat_flutter/defines/custom_color.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';
import 'package:real_chat_flutter/pages/home.dart';
import 'package:real_chat_flutter/pages/register.dart';
import 'package:real_chat_flutter/pages/reset_password.dart';
import 'package:real_chat_flutter/service/global.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    super.initState();
  }

  Future login() async {
    Map<String, dynamic> data = {};
    data = {
      'email': _emailcontroller.text,
      'password': _passwordcontroller.text,
      'type': 1
    };
    var repsonse =
        await Global.getdata(link: '/login/login', method: 'post', data: data);
    if (repsonse != null) {
      Global.prefs.setString('user', jsonEncode(repsonse));
      Global.user = repsonse;
      if (repsonse['isTemporary'] == 1) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const RegisterPage(),
          ),
          (route) => false,
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
          ),
          (route) => false,
        );
      }
    } else {
      debugPrint('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              title: 'Sign in',
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10.0),
                      child: CustomInput(
                        controller: _emailcontroller,
                        height: 55,
                        text: 'Email',
                        underlined: false,
                        prefix: SvgPicture.asset("assets/images/Message.svg"),
                        background: Colors.white,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10.0),
                      child: CustomInput(
                        controller: _passwordcontroller,
                        height: 55,
                        text: 'Password',
                        underlined: false,
                        prefix: SvgPicture.asset("assets/images/Lock.svg"),
                        background: Colors.white,
                        obscure: true,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: 'Forgot your password? ',
                          fontSize: 12,
                          color: CustomColor.navy,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                        GestureDetector(
                            onTap: () => {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          const ResetPage(),
                                    ),
                                    (route) => false,
                                  )
                                },
                            child: const CustomText(
                              text: 'Reset here',
                              fontSize: 12,
                              color: CustomColor.navy,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                              underlined: true,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: CustomButton(
                        title: 'Sign in',
                        onPressed: login,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
