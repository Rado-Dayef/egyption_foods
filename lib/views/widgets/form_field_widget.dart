import 'package:egyption_foods/constants/colors.dart';
import 'package:egyption_foods/constants/extensions.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final Color? color;
  final bool? obscure;
  final int? maxLines;
  final bool? readOnly;
  final bool? autofocus;
  final double? padding;
  final String? initVal;
  final String? labelName;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? placeholder;
  final VoidCallback? onClick;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final void Function(String)? onFieldSubmitted;

  const FormFieldWidget({
    this.color,
    this.padding,
    this.initVal,
    this.obscure,
    this.onClick,
    this.onSaved,
    this.maxLines,
    this.readOnly,
    this.onChanged,
    this.autofocus,
    this.labelName,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.placeholder,
    this.keyboardType,
    this.textController,
    this.textInputAction,
    this.onFieldSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 15),
        child: TextFormField(
          minLines: 1,
          onTap: onClick,
          onSaved: onSaved,
          validator: validator,
          onChanged: onChanged,
          initialValue: initVal,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          controller: textController,
          readOnly: readOnly ?? false,
          autofocus: autofocus ?? false,
          obscureText: obscure ?? false,
          onFieldSubmitted: onFieldSubmitted,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: color ?? AppColors.lightParchmentToneColor,
          textInputAction: textInputAction ?? TextInputAction.next,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          style: TextStyle(color: color ?? AppColors.lightParchmentToneColor),
          decoration: InputDecoration(
            filled: true,
            labelText: labelName,
            hintText: placeholder,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: AppColors.darkBlueColor,
            errorStyle: TextStyle(color: AppColors.redColor),
            prefixIconColor: color ?? AppColors.lightParchmentToneColor,
            suffixIconColor: color ?? AppColors.lightParchmentToneColor,
            labelStyle: TextStyle(color: color ?? AppColors.lightParchmentToneColor),
            hintStyle: TextStyle(color: color ?? AppColors.lightParchmentToneColor.withAlpha(150)),
            border: OutlineInputBorder(borderRadius: 15.borderRadiusAll, borderSide: BorderSide(color: AppColors.darkBlueColor)),
            errorBorder: OutlineInputBorder(borderRadius: 15.borderRadiusAll, borderSide: BorderSide(color: AppColors.darkBlueColor)),
            enabledBorder: OutlineInputBorder(borderRadius: 15.borderRadiusAll, borderSide: BorderSide(color: AppColors.darkBlueColor)),
            focusedBorder: OutlineInputBorder(borderRadius: 15.borderRadiusAll, borderSide: BorderSide(color: AppColors.darkBlueColor)),
            disabledBorder: OutlineInputBorder(borderRadius: 15.borderRadiusAll, borderSide: BorderSide(color: AppColors.darkBlueColor)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: 15.borderRadiusAll, borderSide: BorderSide(color: AppColors.darkBlueColor)),
          ),
        ),
      ),
    );
  }
}
