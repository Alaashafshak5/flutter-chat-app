// ignore_for_file: file_names

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';

class LogisticsPage extends StatefulWidget {
  const LogisticsPage({super.key});

  @override
  State<LogisticsPage> createState() => _LogisticsPageState();
}

class _LogisticsPageState extends State<LogisticsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;
  late int currentindex;
  late TextEditingController _visaNameController;
  late TextEditingController _visaBirthdayController;
  late TextEditingController _visaAddressController;
  late TextEditingController _visaNationalityController;
  late TextEditingController _visaPassportController;
  late TextEditingController _visaExpiryDateController;
  late TextEditingController _pcrNameController;
  late TextEditingController _pcrBirthdayController;
  late TextEditingController _pcrAddressController;
  late TextEditingController _pcrNationalityController;
  late PlatformFile? file;

  @override
  void initState() {
    _tabcontroller = TabController(vsync: this, length: 3, initialIndex: 0);
    currentindex = 0;
    _visaNameController = TextEditingController();
    _visaBirthdayController = TextEditingController();
    _visaAddressController = TextEditingController();
    _visaNationalityController = TextEditingController();
    _visaPassportController = TextEditingController();
    _visaExpiryDateController = TextEditingController();
    _pcrNameController = TextEditingController();
    _pcrBirthdayController = TextEditingController();
    _pcrAddressController = TextEditingController();
    _pcrNationalityController = TextEditingController();

    file = null;
    super.initState();
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  void changeTab(int index) {
    _tabcontroller.animateTo(index);
    setState(() {
      currentindex = _tabcontroller.index;
    });
  }

  Future selectFile() async {
    final res = await FilePicker.platform.pickFiles();
    file = res?.files.first;
    debugPrint('FILE NAME : $file');
    // setState(() {

    // });
    if (file != null) {
      setState((() {}));
    }
    // debugPrint('file $file');
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        bottom: true,
        selectedindex: 2,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 20.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Event Module',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: SizedBox(
                      height: 30,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        GestureDetector(
                          onTap: () {
                            // changeTab(1);
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 10),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: currentindex == 1
                                      ? Colors.white
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'Apply for a visa',
                                style: TextStyle(
                                    color: currentindex == 1
                                        ? Colors.blue
                                        : Colors.white),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            // changeTab(2);
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 10),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: currentindex == 2
                                      ? Colors.white
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text('Upload Vaccine Certificate',
                                  style: TextStyle(
                                      color: currentindex == 2
                                          ? Colors.blue
                                          : Colors.white))),
                        ),
                        GestureDetector(
                          onTap: () {
                            // changeTab(2);
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 10),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: currentindex == 3
                                      ? Colors.white
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text('Submit Inquires',
                                  style: TextStyle(
                                      color: currentindex == 3
                                          ? Colors.blue
                                          : Colors.white))),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                      height: 750,
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabcontroller,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Events that request visa',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: SizedBox(
                                      height: 310,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: SizedBox(
                                                width: 180,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 5.0),
                                                          child: Text(
                                                            'Event 6',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 15.0),
                                                          child: Text(
                                                              '12 Aug, 2022',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        // Image.asset(
                                                        //     'assets/images/test.jpg',
                                                        //     fit: BoxFit.cover),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 140,
                                                          decoration:
                                                              const BoxDecoration(
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: AssetImage(
                                                                    "assets/images/test.jpg")),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                              'description',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {},
                                                                child: Text(
                                                                  'Forum'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {
                                                                      changeTab(
                                                                          1)
                                                                    },
                                                                child: Text(
                                                                  'Visa App'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: SizedBox(
                                                width: 180,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 5.0),
                                                          child: Text(
                                                            'Event 5',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 15.0),
                                                          child: Text(
                                                              '12 Aug, 2022',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        // Image.asset(
                                                        //     'assets/images/test.jpg',
                                                        //     fit: BoxFit.cover),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 140,
                                                          decoration:
                                                              const BoxDecoration(
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: AssetImage(
                                                                    "assets/images/test.jpg")),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                              'description',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {},
                                                                child: Text(
                                                                  'Forum'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {
                                                                      changeTab(
                                                                          1)
                                                                    },
                                                                child: Text(
                                                                  'Visa App'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: SizedBox(
                                                width: 180,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 5.0),
                                                          child: Text(
                                                            'Event 4',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 15.0),
                                                          child: Text(
                                                              '12 Aug, 2022',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        // Image.asset(
                                                        //     'assets/images/test.jpg',
                                                        //     fit: BoxFit.cover),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 140,
                                                          decoration:
                                                              const BoxDecoration(
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: AssetImage(
                                                                    "assets/images/test.jpg")),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                              'description',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {},
                                                                child: Text(
                                                                  'Forum'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {
                                                                      changeTab(
                                                                          1)
                                                                    },
                                                                child: Text(
                                                                  'Visa App'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  const Text(
                                      'Events that request PCR/Vaccination Proof',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: SizedBox(
                                      height: 310,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: SizedBox(
                                                width: 180,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 5.0),
                                                          child: Text(
                                                            'Event 6',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 15.0),
                                                          child: Text(
                                                              '12 Aug, 2022',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        // Image.asset(
                                                        //     'assets/images/test.jpg',
                                                        //     fit: BoxFit.cover),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 140,
                                                          decoration:
                                                              const BoxDecoration(
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: AssetImage(
                                                                    "assets/images/test.jpg")),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                              'description',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {},
                                                                child: Text(
                                                                  'Forum'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {
                                                                      changeTab(
                                                                          2)
                                                                    },
                                                                child: Text(
                                                                  'Submit PCR'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: SizedBox(
                                                width: 180,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 5.0),
                                                          child: Text(
                                                            'Event 5',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 15.0),
                                                          child: Text(
                                                              '12 Aug, 2022',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        // Image.asset(
                                                        //     'assets/images/test.jpg',
                                                        //     fit: BoxFit.cover),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 140,
                                                          decoration:
                                                              const BoxDecoration(
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: AssetImage(
                                                                    "assets/images/test.jpg")),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                              'description',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {},
                                                                child: Text(
                                                                  'Forum'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {
                                                                      changeTab(
                                                                          2)
                                                                    },
                                                                child: Text(
                                                                  'Submit PCR'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: SizedBox(
                                                width: 180,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 5.0),
                                                          child: Text(
                                                            'Event 4',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.0,
                                                                  left: 15.0,
                                                                  bottom: 15.0),
                                                          child: Text(
                                                              '12 Aug, 2022',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        // Image.asset(
                                                        //     'assets/images/test.jpg',
                                                        //     fit: BoxFit.cover),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 140,
                                                          decoration:
                                                              const BoxDecoration(
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: AssetImage(
                                                                    "assets/images/test.jpg")),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Text(
                                                              'description',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {},
                                                                child: Text(
                                                                  'Forum'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                            TextButton(
                                                                onPressed: () =>
                                                                    {
                                                                      changeTab(
                                                                          2)
                                                                    },
                                                                child: Text(
                                                                  'Submit PCR'
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .deepPurpleAccent,
                                                                      fontSize:
                                                                          12),
                                                                ))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  )
                                ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Apply for a Visa',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 20, bottom: 20),
                                  child: SizedBox(
                                    child: Card(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 15.0,
                                                  left: 15.0,
                                                  bottom: 5.0),
                                              child: Text(
                                                'Event 5',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 15.0,
                                                  left: 15.0,
                                                  bottom: 15.0),
                                              child: Text('12 Aug, 2022',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                            // Image.asset(
                                            //     'assets/images/test.jpg',
                                            //     fit: BoxFit.cover),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        "assets/images/test.jpg")),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(15.0),
                                              child: Text('description',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: Text(
                                              'New Visa Application'
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[800]),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText: 'Full Name',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller: _visaNameController,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText:
                                                        'Birthday YY/MM/DD',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller:
                                                    _visaBirthdayController,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText: 'Full Address',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller:
                                                    _visaAddressController,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText: 'Nationality',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller:
                                                    _visaNationalityController,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText: 'Passport Number',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller:
                                                    _visaPassportController,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText:
                                                        'Passport Expiy Date',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller:
                                                    _visaExpiryDateController,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    changeTab(0);
                                                  },
                                                  style: TextButton.styleFrom(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              vertical: 7,
                                                              horizontal: 25),
                                                      backgroundColor:
                                                          Colors.red[600],
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5.0)))),
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  )),
                                              TextButton(
                                                  onPressed: () {},
                                                  style: TextButton.styleFrom(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              vertical: 7,
                                                              horizontal: 60),
                                                      backgroundColor:
                                                          Colors.blue,
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5.0)))),
                                                  child: const Text('Submit',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16)))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Upload Vaccine Certificate',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 20, bottom: 20),
                                  child: SizedBox(
                                    child: Card(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 15.0,
                                                  left: 15.0,
                                                  bottom: 5.0),
                                              child: Text(
                                                'Event 5',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  right: 15.0,
                                                  left: 15.0,
                                                  bottom: 15.0),
                                              child: Text('12 Aug, 2022',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                            // Image.asset(
                                            //     'assets/images/test.jpg',
                                            //     fit: BoxFit.cover),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        "assets/images/test.jpg")),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(15.0),
                                              child: Text('description',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: Text(
                                              'Submit your certificate'
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[800]),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText: 'Full Name',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller: _pcrNameController,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText:
                                                        'Birthday YY/MM/DD',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller:
                                                    _pcrBirthdayController,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText: 'Full Address',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller:
                                                    _pcrAddressController,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 7.0),
                                            child: SizedBox(
                                              height: 40.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 10.0),
                                                    hintText: 'Nationality',
                                                    hintStyle: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                    // fillColor: Colors.white,
                                                    filled: false,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black))),
                                                controller:
                                                    _pcrNationalityController,
                                              ),
                                            ),
                                          ),
                                          const Text('Upload Attachment',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Icon(
                                                  Icons.cloud_upload_outlined,
                                                  color: Colors.blue,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    selectFile();
                                                  },
                                                  child: const Text(
                                                      'Click here to upload your proof of vaccination',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Text(
                                                    file != null
                                                        ? file!.name
                                                        : '',
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      file = null;
                                                    });
                                                  },
                                                  child: Icon(
                                                    file != null
                                                        ? Icons.delete
                                                        : null,
                                                    color: Colors.blue,
                                                    size: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  onPressed: () { changeTab(0);},
                                                  style: TextButton.styleFrom(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              vertical: 7,
                                                              horizontal: 25),
                                                      backgroundColor:
                                                          Colors.red[600],
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5.0)))),
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  )),
                                              TextButton(
                                                  onPressed: () {},
                                                  style: TextButton.styleFrom(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                              vertical: 7,
                                                              horizontal: 60),
                                                      backgroundColor:
                                                          Colors.blue,
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5.0)))),
                                                  child: const Text('Submit',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16)))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ])),
                ])));
  }
}
