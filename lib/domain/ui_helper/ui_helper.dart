import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/domain/utils/app_images.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar(
        {required String mTitle, bool centerTitle = true}) =>
    AppBar(
      title: Text(mTitle),
      centerTitle: centerTitle,
    );

class CTextWidget extends StatelessWidget {
  CTextWidget({super.key, this.cText, this.cTextStyle});
  String? cText;
  TextStyle? cTextStyle;

  @override
  Widget build(BuildContext context) {
    return Text(cText!, style: cTextStyle);
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String headTitle;
  final IconButton? suffixIcon;
  final prefixIconImage;
  final TextInputType keyType;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? suffixStyle;
  final TextEditingController controller;
  final bool? obscureText;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.headTitle,
    this.prefixIconImage,
    required this.keyType,
    this.suffixIcon,
    this.fillColor,
    this.hintStyle,
    this.suffixStyle,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CTextWidget(
            cText: headTitle,
            cTextStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.5,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            keyboardType: keyType,
            obscureText: obscureText!,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Visibility(
                visible: prefixIconImage != null,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    prefixIconImage.toString(),
                    width: 10,
                    height: 8,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorsConstant.primary_Color, width: 1.5),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorsConstant.primary_Color, width: 1.5),
                borderRadius: BorderRadius.circular(16.0),
              ),
              filled: true,
              fillColor: fillColor,
              hintStyle: hintStyle,
              suffixStyle: suffixStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String headTitle;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextEditingController controller;

  TextFieldWidget({
    super.key,
    required this.hintText,
    required this.headTitle,
    this.fillColor,
    this.hintStyle,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CTextWidget(
            cText: headTitle,
            cTextStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.5,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorsConstant.primary_Color, width: 1.5),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorsConstant.primary_Color, width: 1.5),
                borderRadius: BorderRadius.circular(16.0),
              ),
              filled: true,
              fillColor: fillColor,
              hintStyle: hintStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class CommonTIcon extends StatelessWidget {
  String title;
  String image;
  double? size;
  CommonTIcon({super.key, required this.title, required this.image, this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CTextWidget(
          cText: title,
          cTextStyle: TextStyle(
            color: ColorsConstant.secondaryblack_Color,
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(image),
          radius: size,
        )
      ],
    );
  }
}
