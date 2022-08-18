// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';

class EventPage extends StatefulWidget {
  final String title;
  const EventPage(this.title, {super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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
        selectedindex: 1,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.zero, bottom: Radius.circular(15.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Icon(Icons.error_rounded, size: 30.0),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('September, 15th - 2022'),
                                          Text('Location: Paris, FR.'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Going?'),
                                          Checkbox(
                                              value: isGoing,
                                              onChanged: ((value) {}))
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Description. ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                            children: const <TextSpan>[
                              TextSpan(
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                  text:
                                      ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi lectus blandit purus duis consectetur eros elementum a. Proin elementum fringilla vulputate placerat dui quam cras condimentum bibendum.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sessions',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Going?',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: Checkbox(
                                                  value: isGoing,
                                                  onChanged: ((value) {})),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Meeting & Greetings',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '11:30am 12:30 pm - Room 01',
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12),
                                          ),
                                          Text('Speaker: John Smith.',
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 12))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Description. ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700],
                                          fontSize: 13),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13),
                                            text:
                                                ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi lectus blandit purus duis consectetur eros elementum a. Proin elementum fringilla vulputate placerat dui quam cras condimentum bibendum.'),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.download,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                    Text(
                                      'Presentation-Document.pdf',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Going?',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: Checkbox(
                                                  value: isGoing,
                                                  onChanged: ((value) {})),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Meeting & Greetings',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '11:30am 12:30 pm - Room 01',
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12),
                                          ),
                                          Text('Speaker: John Smith.',
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 12))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Description. ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700],
                                          fontSize: 13),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13),
                                            text:
                                                ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi lectus blandit purus duis consectetur eros elementum a. Proin elementum fringilla vulputate placerat dui quam cras condimentum bibendum.'),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.download,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                    Text(
                                      'Presentation-Document.pdf',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Going?',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: Checkbox(
                                                  value: isGoing,
                                                  onChanged: ((value) {})),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Meeting & Greetings',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '11:30am 12:30 pm - Room 01',
                                            style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12),
                                          ),
                                          Text('Speaker: John Smith.',
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 12))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Description. ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700],
                                          fontSize: 13),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13),
                                            text:
                                                ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mi lectus blandit purus duis consectetur eros elementum a. Proin elementum fringilla vulputate placerat dui quam cras condimentum bibendum.'),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.download,
                                      color: Colors.blue,
                                      size: 16,
                                    ),
                                    Text(
                                      'Presentation-Document.pdf',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 11),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ]));
  }
}
