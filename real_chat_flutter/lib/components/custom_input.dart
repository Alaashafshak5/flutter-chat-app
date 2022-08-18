import 'package:flutter/material.dart';
import 'package:real_chat_flutter/components/custom_text.dart';
import 'package:real_chat_flutter/defines/custom_color.dart';

class CustomInput extends StatefulWidget {
  const CustomInput(
      {Key? key,
      this.text,
      required this.controller,
      this.prefix,
      this.suffix,
      this.background,
      required this.underlined,
      this.height = 40,
      this.obscure = false,
      this.onTap,
      this.disabled = false,
      this.outlined = false,
      this.borderRadius = 10,
      this.onIconTap,
      this.validator = false,
      this.onChanged})
      : super(key: key);

  final String? text;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final Color? background;
  final bool underlined;
  final double height;
  final bool obscure;
  final Function()? onTap;
  final bool disabled;
  final bool outlined;
  final double borderRadius;
  final Function()? onIconTap;
  final bool validator;
  final Function(String?)? onChanged;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool isHidden;
  late String _password;
  String _displayText = '';

  // ignore: non_constant_identifier_names
  RegExp pass_valid = RegExp(r"(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  @override
  void initState() {
    isHidden = widget.obscure;
    super.initState();
  }

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _displayText = 'Please enter you password';
      });
    } else {
      if (pass_valid.hasMatch(_password)) {
        if (_password.length < 8) {
          setState(() {
            _displayText = 'Weak Password!';
          });
        } else {
          setState(() {
            _displayText = 'Strong Password!';
          });
        }
      } else {
        setState(() {
          _displayText =
              'Your password must contain at least 6 letters, 1 uppercase character, and 1 special character.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height,
          child: TextField(
            onChanged: (value) => {
              if (widget.validator)
                {_checkPassword(value)}
              else if (widget.onChanged != null)
                {widget.onChanged!(value)}
            },
            style: const TextStyle(fontFamily: 'ProximaNova', fontSize: 15),
            readOnly: widget.disabled,
            onTap: widget.onTap,
            obscuringCharacter: 'x',
            decoration: InputDecoration(
              prefixIcon: widget.prefix != null
                  ? Container(
                      padding: !widget.underlined
                          ? const EdgeInsets.all(15)
                          : const EdgeInsets.only(top: 15, right: 5),
                      child: widget.prefix,
                    )
                  : null,
              suffixIcon: widget.suffix != null
                  ? GestureDetector(
                      onTap: widget.onIconTap,
                      child: Container(
                        padding:
                            !widget.underlined ? const EdgeInsets.all(0) : null,
                        child: widget.suffix,
                      ),
                    )
                  : widget.obscure
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: Icon(
                            isHidden
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                        )
                      : null,
              contentPadding: const EdgeInsets.only(top: 12.0, left: 10.0),
              // ignore: prefer_if_null_ope
              hintText: widget.text,
              hintStyle: widget.text != null
                  ? const TextStyle(
                      color: CustomColor.lightgrey, fontFamily: 'ProximaNova')
                  : null,
              // ignore: prefer_if_null_operators
              fillColor: widget.background != null ? widget.background : null,
              filled: widget.background != null ? true : false,
              border: !widget.underlined
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: widget.outlined
                          ? const BorderSide(color: CustomColor.green, width: 1)
                          : BorderSide.none,
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
              focusedBorder: !widget.underlined
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: widget.outlined
                          ? const BorderSide(color: CustomColor.green, width: 1)
                          : BorderSide.none,
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
              enabledBorder: !widget.underlined
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: widget.outlined
                          ? const BorderSide(color: CustomColor.green, width: 1)
                          : BorderSide.none,
                    )
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
            ),
            controller: widget.controller,
            obscureText: isHidden,
          ),
        ),
        widget.validator
            ? CustomText(
                text: _displayText,
                color: CustomColor.red,
                fontSize: 10,
              )
            : Container()
      ],
    );
  }
}
