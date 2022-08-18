import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_chat_flutter/pages/account.dart';
import 'package:real_chat_flutter/pages/agenda.dart';
import 'package:real_chat_flutter/pages/chat_page.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:real_chat_flutter/pages/events.dart';
import 'package:real_chat_flutter/pages/home.dart';
import 'package:real_chat_flutter/pages/login.dart';
import 'package:real_chat_flutter/pages/logistics.dart';
import 'package:real_chat_flutter/pages/onboarding.dart';
import 'package:real_chat_flutter/pages/resources.dart';
import 'package:real_chat_flutter/pages/settings.dart';
import 'package:real_chat_flutter/pages/reset_password.dart';
import 'package:real_chat_flutter/pages/sessions.dart';
import 'package:real_chat_flutter/pages/interests.dart';
import 'package:real_chat_flutter/service/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Global.prefs = await SharedPreferences.getInstance();
  Global.loaddata();
  if (Global.prefs.containsKey('user')) {
    Global.user = jsonDecode(Global.prefs.getString('user')!);
  }
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Onboarding(),
      '/login': (context) => const Login(),
      '/interests': (context) => const InterestsPage(),
      '/home': (context) => const HomePage(),
      '/chat': (context) => const ChatPage(),
      '/events': (context) => const EventsPage(),
      '/account': (context) => const AccountPage(),
      '/sessions': (context) => const SessionsPage(),
      '/settings': (context) => const SettingsPage(),
      '/resetpassword': (context) => const ResetPage(),
      '/agenda': (context) => const AgendaPage(),
      '/logistics': (context) => const LogisticsPage(),
      '/resources': (context) => const ResourcesPage()
    },
  ));
}
