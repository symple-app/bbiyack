import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';

class SignUpTextFormField extends StatelessWidget {
  final String? hintText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? title;
  final bool autoFocus;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  const SignUpTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.maxLength,
    this.keyboardType,
    this.validator,
    this.title,
    this.autoFocus = true,
    this.focusNode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xff37383C).withOpacity(0.61),
              ),
            ),
          ),
          const SizedBox(height: 8)
        ],
        TextFormField(
          textInputAction: TextInputAction.done,
          focusNode: focusNode,
          autofocus: autoFocus,
          validator: validator,
          onChanged: onChanged,
          cursorColor: const Color(0xff70737C).withOpacity(0.22),
          keyboardType: keyboardType,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            counterText: "",
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorTheme.of(context).label.assistive,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: const Color(0xff70737C).withOpacity(0.22),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: ColorTheme.of(context).primary.normal,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xff70737C).withOpacity(0),
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
      ],
    );
  }
}
