import 'package:flutter/material.dart';
import 'package:real_chat_flutter/components/custom_text.dart';
import 'package:real_chat_flutter/defines/custom_color.dart';

class CustomEvent extends StatefulWidget {
  const CustomEvent(
      {Key? key,
      required this.title,
      required this.date,
      required this.location,
      this.onForum,
      this.onJoin,
      this.image = 'assets/images/test.jpg',
      required this.description,
      this.button = 'Ask to join'})
      : super(key: key);

  final String title;
  final String date;
  final String location;
  final Function()? onForum;
  final Function()? onJoin;
  final String image;
  final String description;
  final String button;

  @override
  State<CustomEvent> createState() => _CustomEventState();
}

class _CustomEventState extends State<CustomEvent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        color: CustomColor.dark,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            fit: BoxFit.fill, image: AssetImage(widget.image)),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 15.0, left: 10.0, bottom: 5.0),
                          child: CustomText(
                            text: widget.title.toUpperCase(),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 15.0, left: 15.0, bottom: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: widget.date,
                              fontSize: 12,
                            ),
                            CustomText(
                              text: widget.location,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/test.jpg")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomText(
                  text: widget.description,
                  fontSize: 12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => {},
                      child: CustomText(
                        text: 'Forum'.toUpperCase(),
                        color: CustomColor.green,
                        fontSize: 12,
                      )),
                  TextButton(
                      onPressed: () => {},
                      child: CustomText(
                        text: widget.button.toUpperCase(),
                        color: CustomColor.green,
                        fontSize: 12,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
