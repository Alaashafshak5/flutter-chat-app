// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:real_chat_flutter/pages/home.dart';
import 'package:tab_container/tab_container.dart';

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  late TextEditingController _usernamecontroller;
  late TextEditingController _namecontroller;
  late TextEditingController _birthdaycontroller;
  late TextEditingController _countrycontroller;
  late TextEditingController _citycontroller;
  late TextEditingController _passwordcontroller;
  late TextEditingController _confirmcontroller;
  late final TabContainerController _controller;
  bool selected = false;

  @override
  void initState() {
    _usernamecontroller = TextEditingController();
    _namecontroller = TextEditingController();
    _birthdaycontroller = TextEditingController();
    _countrycontroller = TextEditingController();
    _citycontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    _confirmcontroller = TextEditingController();
    _controller = TabContainerController(length: 2);
    super.initState();
  }

  void select(value) {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const SizedBox(
          // child: Image.asset('assets/images/alvexo-logo.png'),
          width: 100.0,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    maxHeight: double.infinity,
                    minWidth: constraints.maxWidth,
                    maxWidth: double.infinity),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                          hintText: 'Preferable name',
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey))),
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
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: AspectRatio(
                        aspectRatio: 8 / 14,
                        child: TabContainer(
                          controller: _controller,
                          // color: Theme.of(context).colorScheme.secondary,
                          selectedTextStyle: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.blue, fontSize: 10.0),
                          unselectedTextStyle: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.black, fontSize: 10.0),
                          tabs: const [
                            'Step 1: Basic information',
                            'Step 2 Set your preferences',
                          ],
                          // color: Theme.of(context).colorScheme.secondary,
                          children: [
                            Column(
                              children: [
                                const Text('You were invited to join'),
                                const Text(
                                  '“AI & Robotics Discussions”',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'Fill up with your basic'
                                  ' information to participate in this event.',
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10),
                                  child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                          hintText: 'John Smith',
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          filled: false,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey))),
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                          hintText: '01/01/1995',
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          filled: false,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey))),
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                          hintText: 'Canada, Toronto',
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          filled: false,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey))),
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                          hintText: 'Canadian',
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          filled: false,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey))),
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 10.0),
                                          hintText: 'Password',
                                          hintStyle: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                          filled: false,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey))),
                                      controller: _passwordcontroller,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 10.0),
                                        hintText: 'Conform Password',
                                        hintStyle: const TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                        filled: false,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                                color: Colors.grey))),
                                    controller: _confirmcontroller,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: TextButton(
                                      onPressed: () {
                                        _controller.next();
                                      },
                                      style: TextButton.styleFrom(
                                          fixedSize: Size.infinite,
                                          backgroundColor: Colors.blue[100],
                                          side: const BorderSide(
                                              color: Colors.blue, width: 2.0),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)))),
                                      child: Text(
                                        'Proceed'.toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.blue, fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: 'Select at least ',
                                    style: TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          text: '3 topics of interest'),
                                    ],
                                  ),
                                ),
                                const Text(' You may edit your choices later '),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Wrap(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          select('Interest 1');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: selected
                                                  ? Border.all(
                                                      width: 1,
                                                      color: Colors.red)
                                                  : Border.all(width: 0),
                                              color: Colors.grey),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin: const EdgeInsets.only(
                                              bottom: 5, right: 5),
                                          child: const Text('Interest 1'),
                                          // color: Colors.grey,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          select('Interest Number 2');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: selected
                                                  ? Border.all(
                                                      width: 1,
                                                      color: Colors.red)
                                                  : Border.all(width: 0),
                                              color: Colors.grey),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin: const EdgeInsets.only(
                                              bottom: 5, right: 5),
                                          child: const Text('Interest Number 2'),
                                          // color: Colors.grey,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          select('Artificial Intelligence');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: selected
                                                  ? Border.all(
                                                      width: 1,
                                                      color: Colors.red)
                                                  : Border.all(width: 0),
                                              color: Colors.grey),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin: const EdgeInsets.only(
                                              bottom: 5, right: 5),
                                          child:
                                              const Text('Artificial Intelligence'),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          select('Global Warming');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: selected
                                                  ? Border.all(
                                                      width: 1,
                                                      color: Colors.red)
                                                  : Border.all(width: 0),
                                              color: Colors.grey),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin: const EdgeInsets.only(
                                              bottom: 5, right: 5),
                                          child: const Text('Global Warming'),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          select('Software Engineering');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: selected
                                                  ? Border.all(
                                                      width: 1,
                                                      color: Colors.red)
                                                  : Border.all(width: 0),
                                              color: Colors.grey),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin: const EdgeInsets.only(
                                              bottom: 5, right: 5),
                                          child: const Text('Software Engineering'),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute<void>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const HomePage(),
                                                      ),
                                                      (route) => false);
                                            },
                                            style: TextButton.styleFrom(
                                                fixedSize: Size.infinite,
                                                backgroundColor:
                                                    Colors.blue[100],
                                                side: const BorderSide(
                                                    color: Colors.blue,
                                                    width: 2.0),
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8.0)))),
                                            child: Text(
                                              'Submit'.toUpperCase(),
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )));
      }),
    );
  }
}
