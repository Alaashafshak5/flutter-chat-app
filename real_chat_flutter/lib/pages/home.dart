// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:real_chat_flutter/components/custom_card.dart';
import 'package:real_chat_flutter/components/custom_event.dart';
import 'package:real_chat_flutter/components/custom_text.dart';
import 'package:real_chat_flutter/defines/custom_color.dart';

import '../layouts/MainLayout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        bottom: true,
        selectedindex: 0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: CustomText(
                    text: 'Upcoming Events'.toUpperCase(),
                    color: CustomColor.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: CustomCard(
                      borderColor: const Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: 25,
                      light: true,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 240,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CustomEvent(
                                      title: 'Wildfire Discussion',
                                      date: 'August, 15th - 2022',
                                      location: 'Location: Calgary, Canada.',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CustomEvent(
                                      title: 'Wildfire Discussion',
                                      date: 'August, 15th - 2022',
                                      location: 'Location: Calgary, Canada.',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CustomEvent(
                                      title: 'Wildfire Discussion',
                                      date: 'August, 15th - 2022',
                                      location: 'Location: Calgary, Canada.',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                                    )),
                              ]),
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 10.0, left: 10),
                    child: CustomText(
                      text: 'Events you are registered'.toUpperCase(),
                      color: CustomColor.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: CustomCard(
                      borderColor: const Color.fromRGBO(255, 255, 255, 0.5),
                      borderRadius: 25,
                      light: true,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 240,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CustomEvent(
                                      title: 'Wildfire Discussion',
                                      date: 'August, 15th - 2022',
                                      location: 'Location: Calgary, Canada.',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                                      button: 'Check info.',
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CustomEvent(
                                      title: 'Wildfire Discussion',
                                      date: 'August, 15th - 2022',
                                      location: 'Location: Calgary, Canada.',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                                      button: 'Check info.',
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CustomEvent(
                                      title: 'Wildfire Discussion',
                                      date: 'August, 15th - 2022',
                                      location: 'Location: Calgary, Canada.',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                                      button: 'Check info.',
                                    )),
                              ]),
                        ),
                      ),
                    )),
              ]),
        ));
  }
}
