import 'package:flutter/material.dart';
import 'package:real_chat_flutter/defines/custom_color.dart';

import 'custom_text.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {Key? key,
      this.title,
      this.borderRadius = 10,
      required this.child,
      this.innerColor,
      this.topContent,
      this.topInfo,
      this.bottomContent,
      this.light = false,
      this.borderColor})
      : super(key: key);

  final String? title;
  final double borderRadius;
  final Color? borderColor;
  final Widget child;
  final Color? innerColor;
  final Widget? topContent;
  final Widget? topInfo;
  final Widget? bottomContent;
  final bool light;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: widget.light ? null : const Color.fromRGBO(80, 99, 107, 1),
          border: Border.all(
              color: widget.borderColor ?? CustomColor.green, width: 2),
          gradient: widget.light
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.2),
                    Color.fromRGBO(255, 255, 255, 0),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              widget.topInfo != null || widget.title != null
                  ? Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Color.fromRGBO(91, 108, 116, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: widget.topInfo ??
                            CustomText(
                              text: widget.title != null
                                  ? widget.title!.toUpperCase()
                                  : '',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  : Container(),
              widget.topInfo != null || widget.title != null
                  ? Container(
                      height: 2,
                      color: CustomColor.green,
                    )
                  : Container(),
              widget.topContent != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20, bottom: 10, right: 20),
                      child: Container(
                        child: widget.topContent,
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: !widget.light
                    ? Card(
                        shape: RoundedRectangleBorder(
                          //<-- SEE HERE
                          side: const BorderSide(
                              width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(
                              widget.borderRadius), //<-- SEE HERE
                        ),
                        elevation: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // gradient: widget.innerColor == null
                              //     ? widget.light!
                              //         ? const LinearGradient(
                              //             begin: Alignment.topLeft,
                              //             end: Alignment.bottomRight,
                              //             colors: [
                              //               Color.fromRGBO(255, 255, 255, 255),
                              //               Color.fromRGBO(255, 255, 255, 0.1),
                              //             ],
                              //           )
                              //         : null
                              //     : null,
                              color: widget.innerColor ??
                                  const Color.fromRGBO(91, 108, 116, 1)),
                          child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: widget.child),
                        ),
                      )
                    : widget.child,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  child: widget.bottomContent,
                ),
              ),
            ]));
  }
}
