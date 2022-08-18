import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';
import 'package:real_chat_flutter/service/global.dart';

import '../components/custom_button.dart';
import '../components/custom_card.dart';
import '../components/custom_input.dart';
import '../components/custom_text.dart';
import '../defines/custom_color.dart';
import 'home.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  late TextEditingController _codecontroller;
  late TextEditingController _passwordcontroller;
  late TextEditingController _confirmcontroller;
  late bool confirmed;
  late String warning;
  @override
  void initState() {
    _codecontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    _confirmcontroller = TextEditingController();
    confirmed = false;
    warning = '';
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
              title: 'New password',
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10.0),
                      child: CustomInput(
                        controller: _codecontroller,
                        height: 55,
                        text: 'Code',
                        underlined: false,
                        prefix: SvgPicture.asset("assets/images/Message.svg"),
                        background: Colors.white,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10.0),
                      child: CustomInput(
                        validator: true,
                        controller: _passwordcontroller,
                        height: 55,
                        text: 'New Password',
                        underlined: false,
                        prefix: SvgPicture.asset("assets/images/Lock.svg"),
                        background: Colors.white,
                        obscure: true,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10.0),
                      child: CustomInput(
                        controller: _confirmcontroller,
                        height: 55,
                        text: 'Repeat Password',
                        underlined: false,
                        prefix: SvgPicture.asset("assets/images/Lock.svg"),
                        background: Colors.white,
                        obscure: true,
                        onChanged: ((value) => {
                              if (value == _passwordcontroller.text)
                                {
                                  debugPrint('confirm'),
                                  if (mounted)
                                    setState(() {
                                      confirmed = true;
                                    })
                                }
                              else
                                {
                                  debugPrint('not'),
                                  if (mounted)
                                    setState(() {
                                      warning =
                                          'Please Check if the passwords are equal!';
                                    })
                                }
                            }),
                      )),
                  !confirmed
                      ? CustomText(
                          text: warning,
                          color: CustomColor.red,
                          fontSize: 10,
                        )
                      : Container(),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: CustomButton(
                        title: 'Update Password',
                        onPressed: (() async {
                          if (confirmed) {
                            var reponse = await Global.getdata(
                                link: '/login/change-password',
                                method: 'post',
                                data: {
                                  'email': Global.prefs.getString('email'),
                                  'password': _passwordcontroller.text,
                                  'passwordRresetToken': _codecontroller.text
                                });
                            if (reponse != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushAndRemoveUntil(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const HomePage(),
                                ),
                                (route) => true,
                              );
                              debugPrint(reponse.toString());
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
