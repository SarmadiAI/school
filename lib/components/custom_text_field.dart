import 'package:flutter/material.dart';
import '../const.dart';

class CustomTextField extends StatefulWidget {
  final String? innerText;
  final String? hintText;
  final double? fontSize;
  final double? width;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? readOnly;
  final bool? obscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final TextInputType? keyboardType;
  final Color? color;
  final Color? fontColor;
  final OutlineInputBorder? border;
  final OutlineInputBorder? focusedBorder;
  final int? maxLength;
  final TextAlign? textAlign;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool? isDense;
  final String? errorText;

  const CustomTextField({
    super.key,
    this.innerText,
    this.hintText,
    this.errorText,
    this.fontSize,
    this.width,
    this.controller,
    this.onChanged,
    this.readOnly,
    this.obscure,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.color,
    this.fontColor,
    this.border,
    this.focusedBorder,
    this.maxLength,
    this.textAlign,
    this.isDense,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller!.text = widget.innerText ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          textAlign: widget.textAlign ?? TextAlign.start,
          maxLength: widget.maxLength,
          obscureText: widget.obscure ?? false,
          readOnly: widget.readOnly ?? false,
          keyboardType: widget.keyboardType ?? TextInputType.multiline,
          controller: widget.controller,
          style: textStyle.copyWith(
              fontSize: widget.fontSize, color: widget.fontColor),
          onChanged: widget.onChanged,
          cursorColor: kPurple,
          decoration: InputDecoration(
            errorText: widget.errorText,
            errorStyle:
                textStyle.copyWith(fontSize: widget.fontSize! / 4, color: kRed),
            counterText: '',
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding!,
                vertical: widget.verticalPadding!),
            hintText: widget.readOnly ?? false ? null : widget.hintText,
            hintStyle:
                textStyle.copyWith(fontSize: widget.fontSize, color: kOffWhite),
            filled: true,
            isDense: widget.isDense ?? false,
            fillColor: widget.color,
            border: widget.border, //normal border
            enabledBorder: widget.border, //enabled border
            focusedBorder: widget.readOnly ?? false
                ? widget.border
                : widget.focusedBorder, //focused border
          ),
        ),
      ),
    );
  }
}
