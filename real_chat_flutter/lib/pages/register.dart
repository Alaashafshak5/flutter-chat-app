// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_chat_flutter/components/custom_card.dart';
import 'package:real_chat_flutter/components/custom_input.dart';
import 'package:real_chat_flutter/components/custom_popup.dart';
import 'package:real_chat_flutter/defines/custom_color.dart';
import 'package:real_chat_flutter/defines/custom_data_structure.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';
import 'package:real_chat_flutter/pages/home.dart';
import 'package:real_chat_flutter/service/global.dart';

import '../components/custom_button.dart';
import '../components/custom_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  dynamic user = Global.user;
  List<Item> interests = Global.interests;
  late bool confirmed;
  late String warning;
  late bool error;
  RegExp pass_valid = RegExp(r"(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  late TabController _tabcontroller;
  late TextEditingController _titlecontroller;
  late TextEditingController _datecontroller;
  late TextEditingController _firstnamecontroller;
  late TextEditingController _lastnamecontroller;
  late TextEditingController _companycontroller;
  late TextEditingController _jobtitlecontroller;
  late TextEditingController _passwordcontroller;
  late TextEditingController _confirmcontroller;
  late TextEditingController _interestcontroller;
  late int currentIndex;
  late String title;
  late PlatformFile? file;

  List<Item> list = [
    Item(id: 1, text: 'Mr'),
    Item(id: 2, text: 'Mrs'),
    Item(id: 3, text: 'Miss'),
    Item(id: 4, text: 'Dr'),
    Item(id: 5, text: 'Prof')
  ];

  List<Item> chosen = [];

  @override
  void initState() {
    confirmed = false;
    warning = '';
    error = false;
    _tabcontroller = TabController(vsync: this, length: 2, initialIndex: 0);
    _titlecontroller = TextEditingController();
    _datecontroller = TextEditingController();
    _firstnamecontroller = TextEditingController();
    _lastnamecontroller = TextEditingController();
    _companycontroller = TextEditingController();
    _jobtitlecontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    _confirmcontroller = TextEditingController();
    _interestcontroller = TextEditingController();
    currentIndex = _tabcontroller.index + 1;
    file = null;

    _firstnamecontroller.text = user['user']['firstName'];
    _lastnamecontroller.text = user['user']['lastName'];
    _companycontroller.text = user['user']['company'];

    debugPrint(interests[0].text);
    super.initState();
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  Future selectFile() async {
    final res = await FilePicker.platform.pickFiles(type: FileType.image);
    file = res?.files.first;
    debugPrint('FILE NAME : $file');
    if (file != null) {
      setState((() {}));
    }
  }

  void _showGenderPicker(List<Item> list, int current) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => SizedBox(
              width: double.infinity,
              height: 100,
              child: CupertinoPicker(
                backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
                itemExtent: 30,
                scrollController:
                    FixedExtentScrollController(initialItem: current),
                children: [
                  for (var x in list)
                    Text(
                      x.text,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    _titlecontroller.text = list[value].text;
                  });
                },
              ),
            ));
  }

  Future register() async {
    if (_firstnamecontroller.text != '' &&
        _lastnamecontroller.text != '' &&
        _titlecontroller.text != '' &&
        _datecontroller.text != '' &&
        _companycontroller.text != '' &&
        _jobtitlecontroller.text != '' &&
        _passwordcontroller.text != '' &&
        _confirmcontroller.text != '' &&
        pass_valid.hasMatch(_passwordcontroller.text) &&
        _passwordcontroller.text.length >= 8 &&
        file != null &&
        chosen != [] &&
        confirmed) {
      List i = [];
      // ignore: avoid_function_literals_in_foreach_calls
      chosen.forEach((element) {
        i.add(element.id);
      });
      dynamic title;
      // ignore: avoid_function_literals_in_foreach_calls
      list.forEach((element) {
        if (_titlecontroller.text == element.text) {
          title = element.id;
        }
      });

      Map<String, dynamic> data = {
        'loginId': user['user']['loginId'],
        'firstName': _firstnamecontroller.text,
        'lastName': _lastnamecontroller.text,
        'dob': _datecontroller.text,
        'profession': _jobtitlecontroller.text,
        'company': _companycontroller.text,
        'title': title,
        'password': _passwordcontroller.text,
        'profileImg': file!.path,
        'interest': i,
      };

      var response = await Global.getdata(
          link: '/user/register', method: 'post', data: data);

      if (response != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
          ),
          (route) => false,
        );
      }

      debugPrint(response.toString());
      setState(() {
        error = false;
      });
    } else {
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      bottom: true,
      selectedindex: 0,
      barButton: const CustomText(
        text: 'Sign in',
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height > 400
                  ? MediaQuery.of(context).size.height * 0.9
                  : 570,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabcontroller,
                children: [
                  SingleChildScrollView(
                    child: CustomCard(
                      innerColor: Colors.white,
                      topInfo: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: selectFile,
                              child: Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  Container(
                                      width: 55,
                                      height: 55,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: file != null
                                          ? Image(
                                              image:
                                                  FileImage(File(file!.path!)),
                                              fit: BoxFit.cover,
                                            )
                                          : const Icon(Icons.person)),
                                  const Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(Icons.add_a_photo),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Juan@gmail.com'.toUpperCase(),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                  text:
                                      'Ai & Robotics discussions'.toUpperCase(),
                                  fontSize: 12)
                            ],
                          )
                        ],
                      ),
                      topContent: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Personal Information'.toUpperCase(),
                            underlined: true,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            underlinColor: CustomColor.green,
                          ),
                          const CustomText(text: 'Step 1 of 2'),
                        ],
                      ),
                      bottomContent: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              width: 130,
                              borderRadius: 16,
                              backgroundColor: CustomColor.red,
                              title: 'Cancel',
                              onPressed: (() {
                                Navigator.of(context).pushAndRemoveUntil(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const RegisterPage(),
                                  ),
                                  (route) => false,
                                );
                              }),
                            ),
                            CustomButton(
                              borderRadius: 16,
                              width: 150,
                              title: 'Proceed',
                              onPressed: (() {
                                _tabcontroller.animateTo(currentIndex);
                                setState(() {
                                  currentIndex = 2;
                                });
                              }),
                            )
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  child: CustomInput(
                                    disabled: true,
                                    onTap: () => _showGenderPicker(list, 1),
                                    controller: _titlecontroller,
                                    underlined: true,
                                    prefix: const CustomText(
                                      text: 'Title*',
                                      color: CustomColor.grey,
                                      fontSize: 15,
                                    ),
                                    suffix: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  child: CustomInput(
                                    disabled: true,
                                    controller: _datecontroller,
                                    underlined: true,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return Theme(
                                            data: ThemeData.dark().copyWith(
                                                colorScheme:
                                                    const ColorScheme.dark(
                                                  brightness: Brightness.light,
                                                  background: CustomColor.dark,
                                                  onBackground:
                                                      CustomColor.dark,
                                                  primary: CustomColor.green,
                                                  onPrimary: Colors.white,
                                                ),
                                                scaffoldBackgroundColor:
                                                    CustomColor.green,
                                                shadowColor: CustomColor.green,
                                                primaryColor: CustomColor
                                                    .green, //Head background
                                                dialogBackgroundColor:
                                                    CustomColor.dark),
                                            child: child!,
                                          );
                                        },
                                      );

                                      if (pickedDate != null) {
                                        String formattedDate =
                                            DateFormat('dd/MM/yy')
                                                .format(pickedDate);
                                        setState(() {
                                          _datecontroller.text = formattedDate;
                                        });
                                      } else {}
                                    },
                                    suffix: const Icon(
                                      Icons.calendar_month,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomInput(
                              controller: _firstnamecontroller,
                              underlined: true,
                              prefix: const CustomText(
                                text: 'First Name:',
                                color: CustomColor.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomInput(
                              controller: _lastnamecontroller,
                              underlined: true,
                              prefix: const CustomText(
                                text: 'Last Name:',
                                color: CustomColor.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomInput(
                              controller: _companycontroller,
                              underlined: true,
                              prefix: const CustomText(
                                text: 'Company:',
                                color: CustomColor.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomInput(
                              controller: _jobtitlecontroller,
                              underlined: true,
                              prefix: const CustomText(
                                text: 'Title*:',
                                color: CustomColor.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomInput(
                              validator: true,
                              obscure: true,
                              controller: _passwordcontroller,
                              underlined: true,
                              prefix: const CustomText(
                                text: 'Password*:',
                                color: CustomColor.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomInput(
                              obscure: true,
                              controller: _confirmcontroller,
                              underlined: true,
                              prefix: const CustomText(
                                text: 'Confirm Password*:',
                                color: CustomColor.grey,
                                fontSize: 15,
                              ),
                              onChanged: ((value) => {
                                    debugPrint(value),
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
                                            confirmed = false;
                                            warning =
                                                'Please Check if the passwords are equal!';
                                          })
                                      }
                                  }),
                            ),
                          ),
                          !confirmed
                              ? CustomText(
                                  text: warning,
                                  color: CustomColor.red,
                                  fontSize: 10,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: CustomCard(
                      bottomContent: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          error
                              ? const CustomText(
                                  text:
                                      'Make sure you filled all the fields correctly',
                                  color: CustomColor.red,
                                  fontSize: 12,
                                )
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: CustomText(
                              text: 'New Interest'.toUpperCase(),
                              underlinColor: CustomColor.green,
                              underlined: true,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          CustomInput(
                            onTap: () async {
                              try {
                                Item clicked = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CustomPopup(data: interests),
                                  ),
                                );
                                debugPrint(clicked.text);
                                if (!chosen.contains(clicked)) {
                                  chosen.add(clicked);
                                }
                              } catch (e) {
                                debugPrint(e.toString());
                              }
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            controller: _interestcontroller,
                            underlined: false,
                            text: 'Type here',
                            disabled: true,
                            outlined: true,
                            background: Colors.white,
                            borderRadius: 15,
                            suffix: const Icon(
                              Icons.add_circle,
                              color: CustomColor.green,
                            ),
                            onIconTap: () async {
                              try {
                                Item clicked = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CustomPopup(data: interests),
                                  ),
                                );
                                debugPrint(clicked.text);
                                if (!chosen.contains(clicked)) {
                                  chosen.add(clicked);
                                }
                              } catch (e) {
                                debugPrint(e.toString());
                              }
                              if (mounted) {
                                setState(() {});
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  borderRadius: 16,
                                  width: 130,
                                  backgroundColor: CustomColor.red,
                                  title: 'Back',
                                  onPressed: (() {
                                    _tabcontroller.animateTo(0);
                                    setState(() {
                                      currentIndex = 1;
                                      title = 'Personal Information';
                                    });
                                  }),
                                ),
                                CustomButton(
                                  borderRadius: 16,
                                  width: 150,
                                  title: 'Continue',
                                  onPressed: register,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      innerColor: Colors.white,
                      topInfo: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: selectFile,
                              child: Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  Container(
                                      clipBehavior: Clip.hardEdge,
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: file != null
                                          ? Image(
                                              image:
                                                  FileImage(File(file!.path!)),
                                              fit: BoxFit.cover,
                                            )
                                          : const Icon(Icons.person)),
                                  const Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(Icons.add_a_photo),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Juan@gmail.com'.toUpperCase(),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                  text:
                                      'Ai & Robotics discussions'.toUpperCase(),
                                  fontSize: 12)
                            ],
                          )
                        ],
                      ),
                      topContent: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Topic of interest'.toUpperCase(),
                            underlined: true,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            underlinColor: CustomColor.green,
                          ),
                          const CustomText(text: 'Step 2 of 2'),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chosen != []
                              ? Wrap(
                                  children: [
                                    for (var x in chosen)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: (InputChip(
                                          elevation: 5,
                                          padding: const EdgeInsets.all(5),
                                          label: CustomText(
                                            text: x.text.toUpperCase(),
                                            fontSize: 15,
                                            color: CustomColor.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          backgroundColor: Colors.white,
                                          onSelected: (bool value) {},
                                          deleteIcon: const Icon(
                                            Icons.cancel,
                                            size: 20,
                                          ),
                                          onDeleted: () {
                                            chosen.remove(x);
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          },
                                        )),
                                      )
                                  ],
                                )
                              : Wrap(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
