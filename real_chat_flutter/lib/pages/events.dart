// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';

import 'event.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;
  late int currentindex;

  @override
  void initState() {
    _tabcontroller = TabController(vsync: this, length: 3, initialIndex: 0);
    currentindex = 0;
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

  @override
  // List i = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  Widget build(BuildContext context) {
    return MainLayout(
        bottom: true,
        selectedindex: 3,
        child :Padding(
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
                          changeTab(1);
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
                              'Sessions to Attend',
                              style: TextStyle(
                                  color: currentindex == 1
                                      ? Colors.blue
                                      : Colors.white),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          changeTab(2);
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
                            child: Text('View Replays',
                                style: TextStyle(
                                    color: currentindex == 2
                                        ? Colors.blue
                                        : Colors.white))),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height:500,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabcontroller, children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Events you are invited to',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              height: 310,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: SizedBox(
                                        width: 180,
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
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
                                                    'Event 6',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15.0,
                                                      left: 15.0,
                                                      bottom: 15.0),
                                                  child: Text('12 Aug, 2022',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                // Image.asset(
                                                //     'assets/images/test.jpg',
                                                //     fit: BoxFit.cover),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 140,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "assets/images/test.jpg")),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Text('description',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () => {},
                                                        child: Text(
                                                          'Forum'.toUpperCase(),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .deepPurpleAccent,
                                                              fontSize: 12),
                                                        )),
                                                    TextButton(
                                                        onPressed: () => {},
                                                        child: Text(
                                                          'Check info.'
                                                              .toUpperCase(),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .deepPurpleAccent,
                                                              fontSize: 12),
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
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: SizedBox(
                                        width: 180,
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15.0,
                                                      left: 15.0,
                                                      bottom: 15.0),
                                                  child: Text('12 Aug, 2022',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                // Image.asset(
                                                //     'assets/images/test.jpg',
                                                //     fit: BoxFit.cover),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 140,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "assets/images/test.jpg")),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Text('description',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () => {},
                                                        child: Text(
                                                          'Forum'.toUpperCase(),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .deepPurpleAccent,
                                                              fontSize: 12),
                                                        )),
                                                    TextButton(
                                                        onPressed: () => {},
                                                        child: Text(
                                                          'Check info.'
                                                              .toUpperCase(),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .deepPurpleAccent,
                                                              fontSize: 12),
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
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: SizedBox(
                                        width: 180,
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
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
                                                    'Event 4',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15.0,
                                                      left: 15.0,
                                                      bottom: 15.0),
                                                  child: Text('12 Aug, 2022',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                // Image.asset(
                                                //     'assets/images/test.jpg',
                                                //     fit: BoxFit.cover),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 140,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "assets/images/test.jpg")),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Text('description',
                                                      style: TextStyle(
                                                          fontSize: 12)),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () => {},
                                                        child: Text(
                                                          'Forum'.toUpperCase(),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .deepPurpleAccent,
                                                              fontSize: 12),
                                                        )),
                                                    TextButton(
                                                        onPressed: () => {},
                                                        child: Text(
                                                          'Check info.'
                                                              .toUpperCase(),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .deepPurpleAccent,
                                                              fontSize: 12),
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
                          const Text('Last replays uploads ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: SizedBox(
                                height: 102,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: SizedBox(
                                          width: 180,
                                          child: Card(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 60,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "assets/images/test.jpg")),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  color: Colors.grey,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: const [
                                                      Text(
                                                        'Meeting & Greetings',
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      Icon(Icons.play_circle)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: SizedBox(
                                          width: 180,
                                          child: Card(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 60,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "assets/images/test.jpg")),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  color: Colors.grey,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: const [
                                                      Text(
                                                        'Meeting & Greetings',
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      Icon(Icons.play_circle)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: SizedBox(
                                          width: 180,
                                          child: Card(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 60,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "assets/images/test.jpg")),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  color: Colors.grey,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: const [
                                                      Text(
                                                        'Meeting & Greetings',
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      Icon(Icons.play_circle)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              )),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: GestureDetector(
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
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Sessions you are going',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 250,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 250,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 250,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.of(context).pushAndRemoveUntil(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
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
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Sessions you are going',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 250,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 250,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    height: 90,
                                    width: 250,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: GestureDetector(
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
                        ),
                        SizedBox(
                          height: 102,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    width: 180,
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/test.jpg")),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: Colors.grey,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: const [
                                                Text(
                                                  'Meeting & Greetings',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(Icons.play_circle)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    width: 180,
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/test.jpg")),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: Colors.grey,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: const [
                                                Text(
                                                  'Meeting & Greetings',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(Icons.play_circle)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    width: 180,
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/test.jpg")),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: Colors.grey,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: const [
                                                Text(
                                                  'Meeting & Greetings',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(Icons.play_circle)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.of(context).pushAndRemoveUntil(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
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
                        ),
                        SizedBox(
                          height: 102,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    width: 180,
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/test.jpg")),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: Colors.grey,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: const [
                                                Text(
                                                  'Meeting & Greetings',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(Icons.play_circle)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    width: 180,
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/test.jpg")),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: Colors.grey,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: const [
                                                Text(
                                                  'Meeting & Greetings',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(Icons.play_circle)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    width: 180,
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/test.jpg")),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            color: Colors.grey,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: const [
                                                Text(
                                                  'Meeting & Greetings',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(Icons.play_circle)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ]),
                )
              ]),
        ));
  }
}
