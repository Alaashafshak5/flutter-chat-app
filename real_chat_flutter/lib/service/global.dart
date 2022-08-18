import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../defines/custom_data_structure.dart';

class Global {
  static String api = "http://10.0.2.2:5001";
  static String imgPath = "http://10.0.2.2:5001/uploads/";
  static List<Item> interests = [];
  static late SharedPreferences prefs;
  static dynamic user;
  static getdata(
      {required String link,
      required String method,
      Map<String, dynamic>? data}) async {
    try {
      http.Response response;
      if (method == "get") {
        response = await http.get(
          Uri.parse("${Global.api}$link"),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
        );
      } else {
        var request =
            http.MultipartRequest('POST', Uri.parse("${Global.api}$link"));
        request.headers.addAll(
            {"Accept": "application/json", "Content-Type": "application/json"});
        if (data != null) {
          data.forEach((k, v) {
            if (k != 'file') {
              request.fields[k] = v.toString();
            } else {
              data[k].forEach((kf, vf) async {
                request.files
                    .add(await http.MultipartFile.fromPath(kf, data[k][kf]));
              });
            }
          });
        }
        var rep = await request.send();
        response = await http.Response.fromStream(rep);
      }
      var responseData = jsonDecode(response.body);
      debugPrint(responseData.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return responseData['data'];
      }
      // else
    } catch (e) {
      debugPrint('error');
      debugPrint(e.toString());
    }
    return null;
  }

  static loaddata() async {
    var resource = await getdata(link: '/interest/get-all', method: 'get');
    if (resource != null) {
      for (var element in resource) {
        interests.add(Item(id: element['id'], text: element['name']));
      }
    }
    debugPrint(resource.toString());
  }
}
