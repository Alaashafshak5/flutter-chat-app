// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(bottom: true,
      selectedindex:  0, child:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
           Row(
            children: const [
              
            ],
           )
          ]),
        ));
  }
}
