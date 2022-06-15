import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.validator,
    this.onSuffixButtonTap,
    this.suffixIcon,
    this.suffix,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLength,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.name,
    this.inputAction = TextInputAction.done,
    this.height = 40,
    this.width = 0,
    this.borderRadius = 12,
    this.initialValue,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.onEditingComplete,
    this.autoFillHints,
    this.enabled = true,
    this.prefixText,
  }) : super(key: key);
  final TextInputAction inputAction;
  final String? initialValue;
  final int? maxLength;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onSuffixButtonTap;
  final String labelText;
  final String? hintText;
  final String? prefixText;
  final IconData? suffixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final double height;
  final double width;
  final double borderRadius;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final List<String>? autoFillHints;

  @override
  Widget build(BuildContext context) {
    if (suffixIcon != null) {
      assert(suffix == null, "you can't use both suffix and suffixIcon");
    }
    if (suffix != null) {
      assert(suffixIcon == null, "you can't use both suffix and suffixIcon");
    }
    final fieldWidth = width == 0 ? Get.width : width;
    return Container(
      width: fieldWidth,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        autofillHints: autoFillHints,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // style: ThemeText.blackBookSubtitle_1_16F_50Opacity,
        controller: controller,
        keyboardType: keyboardType,
        onSaved: onSaved,
        readOnly: readOnly,
        enabled: enabled,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        maxLength: maxLength,
        textInputAction: inputAction,
        minLines: keyboardType == TextInputType.multiline ? 10 : 1,
        maxLines: keyboardType == TextInputType.multiline ? 10 : 1,
        validator: validator,
        obscureText: obscureText,

        initialValue: initialValue,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            // borderSide: BorderSide(
            //   color: AppColor.blackColor.withOpacity(0.2),
            //   width: 2,
            // ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            // borderSide: BorderSide(
            //   color: AppColor.blackColor.withOpacity(0.2),
            //   width: 2,
            // ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            // borderSide: BorderSide(
            //   color: AppColor.blackColor.withOpacity(0.2),
            //   width: 2,
            // ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 12,
            bottom: 12,
          ),
          labelText: labelText,
          // labelStyle: ThemeText.bodyTwo,
          prefixText: prefixText,

          suffixIcon: suffix ??
              IconButton(
                icon: Icon(suffixIcon),
                color: Colors.grey,
                onPressed: onSuffixButtonTap,
              ),
          // hintText: hintText,
        ),
      ),
    );
  }
}
