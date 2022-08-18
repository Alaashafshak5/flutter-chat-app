// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_chat_flutter/defines/custom_color.dart';
import 'package:real_chat_flutter/pages/home.dart';
import 'package:real_chat_flutter/pages/logistics.dart';
import 'package:real_chat_flutter/pages/resources.dart';
import '../pages/events.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final int? selectedindex;
  final Color? backColor;
  final bool bottom;
  final bool floatingButton;
  final Widget? barButton;
  // final bool navButton;

  const MainLayout(
      {Key? key,
      required this.child,
      this.selectedindex,
      this.backColor,
      required this.bottom,
      this.floatingButton = false,
      this.barButton})
      : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int current;
  void _onItemTapped(int index) {
    // ignore: prefer_typing_uninitialized_variables
    var nav;
    setState(() {
      current = index;
    });
    switch (index) {
      case 0:
        nav = const HomePage();
        break;
      case 1:
        nav = const ResourcesPage();
        break;
      case 2:
        nav = const LogisticsPage();
        break;
      case 3:
        nav = const EventsPage();
        break;
      default:
        nav = null;
    }
    if (nav != null) {
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => nav,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ),
        (route) => false,
      );
      // Navigator.pushNamed(context, nav);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    if (widget.selectedindex != null) {
      setState(() {
        current = widget.selectedindex!;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          // ignore: prefer_if_null_operators
          widget.backColor != null ? widget.backColor : CustomColor.navy,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: CustomColor.dark,
        title: SizedBox(
          width: 100.0,
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: widget.barButton != null
            ? [
                Center(child: widget.barButton!),
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.arrow_drop_down_sharp,
                      color: CustomColor.green),
                )
              ]
            : [],
        // centerTitle: true,
      ),
      floatingActionButton: widget.floatingButton
          ? FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.headset_mic),
            )
          : null,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
                minWidth: constraints.maxWidth,
                maxWidth: double.infinity),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: widget.child,
            ),
          ),
        );
      }),
      bottomNavigationBar: widget.bottom
          ? BottomNavigationBar(
              backgroundColor: CustomColor.dark,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.edit_note_outlined),
                  label: 'Resources',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/brain.svg'),
                  activeIcon: SvgPicture.asset(
                    'assets/images/brain.svg',
                    color: CustomColor.green,
                  ),
                  label: 'Logistics',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.event),
                  label: 'Events',
                ),
              ],
              currentIndex: current,
              selectedItemColor: CustomColor.green,
              unselectedItemColor: Colors.grey[400],
              unselectedLabelStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500),
              selectedLabelStyle:
                  const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
              showUnselectedLabels: true,
              onTap: _onItemTapped,
            )
          : null,
    );
  }
}
