import 'package:flutter/material.dart';
import '../const.dart';

class CustomDropDownMenu extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final double? width;
  final String? controller;
  final List<String>? options;
  final void Function(String)? onChanged;
  final Widget? icon;

  const CustomDropDownMenu({
    super.key,
    this.hintText,
    this.fontSize,
    this.width,
    this.controller,
    this.options,
    this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                right: fontSize! * 2,
                left: 8,
              ),
              filled: true,
              fillColor: kGray,
              border: roundedInputBorder(), //normal border
              enabledBorder: roundedInputBorder(), //enabled border
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: kGray,
                menuMaxHeight: fontSize! * 14,
                style: textStyle.copyWith(fontSize: fontSize),
                hint: Text(
                  hintText!,
                  style:
                      textStyle.copyWith(fontSize: fontSize, color: kOffWhite),
                ),
                value: controller,
                isDense: false,
                icon: icon,
                onChanged: (text) {
                  onChanged!(text!);
                },
                items: options!.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )),
      ),
    );
  }
}
