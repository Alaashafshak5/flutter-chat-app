// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:real_chat_flutter/pages/event.dart';

import '../layouts/MainLayout.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  late bool isGoing;

  @override
  void initState() {
    isGoing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      bottom: true,
        selectedindex:1,
      child:  Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Agenda',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 100000)),
                    onDateChanged: (value) {}),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context).pushAndRemoveUntil(
                          PageRouteBuilder(
                            pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                const EventPage(
                                    'AI & Robotics Discussion Event'),
                          ),
                          (route) => true,
                        )
                      },
                      child: Row(
                        children: const [
                          Text('AI & Robotics Discussion Event',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.open_in_new,
                            color: Colors.blue,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Going?',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Checkbox(
                          value: isGoing,
                          onChanged: (value) => {
                            setState(
                              () => {isGoing = !isGoing},
                            )
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  height: 90,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        width: 250,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Going?',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: Checkbox(
                                            value: isGoing, onChanged: ((value) {})),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Meeting & Greetings',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('11:30am 12:30 pm - Room 01',
                                        style: TextStyle(fontSize: 12)),
                                    Text('Speaker: John Smith.',
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        width: 250,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                        'Going?',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: Checkbox(
                                            value: isGoing, onChanged: ((value) {})),
                                      )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Meeting & Greetings',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('11:30am 12:30 pm - Room 01',
                                        style: TextStyle(fontSize: 12)),
                                    Text('Speaker: John Smith.',
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        width: 250,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                        'Going?',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: Checkbox(
                                            value: isGoing, onChanged: ((value) {})),
                                      )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Meeting & Greetings',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('11:30am 12:30 pm - Room 01',
                                        style: TextStyle(fontSize: 12)),
                                    Text('Speaker: John Smith.',
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context).pushAndRemoveUntil(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const EventPage('Global Warming Event'),
                          ),
                          (route) => true,
                        )
                      },
                      child: Row(
                        children: const [
                          Text('Global Warming Event',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.open_in_new,
                            color: Colors.blue,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Going?',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Checkbox(
                          value: isGoing,
                          onChanged: (value) => {
                            setState(
                              () => {isGoing = !isGoing},
                            )
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 20.0),
                child: SizedBox(
                  height: 90,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        width: 250,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                        'Going?',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: Checkbox(
                                            value: isGoing, onChanged: ((value) {})),
                                      )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Meeting & Greetings',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('11:30am 12:30 pm - Room 01',
                                        style: TextStyle(fontSize: 12)),
                                    Text('Speaker: John Smith.',
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        width: 250,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   const Text(
                                        'Going?',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: Checkbox(
                                            value: isGoing, onChanged: ((value) {})),
                                      )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Meeting & Greetings',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('11:30am 12:30 pm - Room 01',
                                        style: TextStyle(fontSize: 12)),
                                    Text('Speaker: John Smith.',
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        width: 250,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   const Text(
                                        'Going?',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: Checkbox(
                                            value: isGoing, onChanged: ((value) {})),
                                      )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Meeting & Greetings',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('11:30am 12:30 pm - Room 01',
                                        style: TextStyle(fontSize: 12)),
                                    Text('Speaker: John Smith.',
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ]));
  }
}
