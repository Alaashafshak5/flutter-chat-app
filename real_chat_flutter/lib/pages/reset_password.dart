// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_chat_flutter/components/custom_text.dart';
import 'package:real_chat_flutter/defines/custom_color.dart';
import 'package:real_chat_flutter/pages/new_password.dart';
import 'package:real_chat_flutter/service/global.dart';

import '../components/custom_button.dart';
import '../components/custom_card.dart';
import '../components/custom_input.dart';
import '../layouts/MainLayout.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  late TextEditingController _emailcontroller;
  late bool error;

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    error = false;
    super.initState();
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
              title: 'Forgot your password?',
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
                  error
                      ? const CustomText(
                          text: 'Please Try again later',
                          fontSize: 12,
                          color: CustomColor.red,
                        )
                      : Container(),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: CustomButton(
                        title: 'Request a new password',
                        width: 220,
                        onPressed: (() async {
                          if (_emailcontroller.text != null) {
                            var response = await Global.getdata(
                                link: '/login/request-change-password',
                                method: 'post',
                                data: {'email': _emailcontroller.text});
                            debugPrint(response.toString());
                            Global.prefs
                                .setString('email', _emailcontroller.text);
                            if (response != null) {
                              setState(() {
                                error = false;
                              });
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushAndRemoveUntil(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const NewPasswordPage(),
                                ),
                                (route) => true,
                              );
                            } else {
                              setState(() {
                                error = true;
                              });
                            }
                          }
                        }),
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
