// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _usernamecontroller;
  late TextEditingController _namecontroller;
  late TextEditingController _birthdaycontroller;
  late TextEditingController _countrycontroller;
  late TextEditingController _citycontroller;
  late TextEditingController _passwordcontroller;
  @override
  void initState() {
    _usernamecontroller = TextEditingController();
    _namecontroller = TextEditingController();
    _birthdaycontroller = TextEditingController();
    _countrycontroller = TextEditingController();
    _citycontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      selectedindex: 5,
      backColor: Colors.white,
      bottom: true,
      child: Column(children: [
        Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.blue,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        height: 38,
                        width: 160,
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                                size: 16,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              hintText: 'Preferable name',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                          controller: _usernamecontroller,
                        ),
                      ),
                    ),
                    const Text(
                      'johnsmith@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'OriginAll - VP Marketing ',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: AspectRatio(
                aspectRatio: 8 / 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        'Basic Informtion',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              hintText: 'Full Name',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              filled: false,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                          controller: _namecontroller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              hintText: 'Birthday YY/MM/DD',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              filled: false,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                          controller: _birthdaycontroller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              hintText: 'Full Address',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              filled: false,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                          controller: _citycontroller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              hintText: 'Nationality',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              filled: false,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                          controller: _countrycontroller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              filled: false,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                          controller: _passwordcontroller,
                        ),
                      ),
                    ),
                    GestureDetector(
                        child: const Text(
                      'Wants to change your password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Your Interests',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Wrap(
                      children: [
                        InputChip(
                          label: const Text('Input 1'),
                          onSelected: (bool value) {},
                          deleteIcon: const Icon(Icons.cancel),
                        ),
                        InputChip(
                          label: const Text('Input 1'),
                          onSelected: (bool value) {},
                          deleteIcon: const Icon(Icons.cancel),
                        ),
                        InputChip(
                          label: const Text('Input 1'),
                          onSelected: (bool value) {},
                          deleteIcon: const Icon(Icons.cancel),
                        ),
                        InputChip(
                          label: const Text('Input 1'),
                          onSelected: (bool value) {},
                          deleteIcon: const Icon(Icons.cancel),
                        ),
                        InputChip(
                          label: const Text('Input 1'),
                          onSelected: (bool value) {},
                          deleteIcon: const Icon(Icons.cancel),
                        ),
                        InputChip(
                          label: const Text('Input 1'),
                          onSelected: (bool value) {},
                          deleteIcon: const Icon(Icons.cancel),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        )
      ]),
    );
  }
}
