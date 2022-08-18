import 'package:flutter/material.dart';
import 'package:real_chat_flutter/components/custom_text.dart';
import 'package:real_chat_flutter/layouts/MainLayout.dart';
import '../defines/custom_data_structure.dart';

class CustomPopup extends StatefulWidget {
  const CustomPopup({Key? key, required this.data}) : super(key: key);
  final List<Item> data;
  @override
  State<CustomPopup> createState() => _CustomPopupState();
}
class _CustomPopupState extends State<CustomPopup> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        bottom: false,
        child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: widget.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(widget.data[index]);
                        },
                        child: Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(236, 236, 236, 1)))),
                          child: ListTile(
                            title: CustomText(text: widget.data[index].text.toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}