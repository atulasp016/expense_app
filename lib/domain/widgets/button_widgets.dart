import 'package:expense_app/domain/ui_helper/ui_helper.dart';
import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/domain/utils/app_images.dart';
import 'package:flutter/material.dart';

class OutlineGoogleBTN extends StatelessWidget {
  OutlineGoogleBTN({super.key, required this.onTap});
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsConstant.white_Color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 1.5, color: ColorsConstant.secondaryblack_Color),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageConstant.ic_google,
                fit: BoxFit.fill,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              CTextWidget(
                cText: 'Continue with Google',
                cTextStyle: TextStyle(
                  color: ColorsConstant.secondaryblack_Color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlineEmailBTN extends StatelessWidget {
  OutlineEmailBTN({super.key, required this.onTap});
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsConstant.white_Color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 1.5, color: ColorsConstant.secondaryblack_Color),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CTextWidget(
                cText: 'Continue with Email',
                cTextStyle: TextStyle(
                  color: ColorsConstant.secondaryblack_Color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                ImageConstant.ic_mail,
                fit: BoxFit.fill,
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlineBTN extends StatelessWidget {
  OutlineBTN({
    super.key,
    required this.text,
    required this.onTap,
    this.mWidget,
  });
  VoidCallback onTap;
  final String text;
  Widget? mWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
              width: 1.5, color: ColorsConstant.secondaryblack_Color),
        ),
        child: Center(
          child: mWidget ??
              CTextWidget(
                cText: text,
                cTextStyle: TextStyle(
                  color: ColorsConstant.secondaryblack_Color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
        ),
      ),
    );
  }
}



class ElevatedBTN extends StatelessWidget {
  String cText;
  VoidCallback onTap;
  ElevatedBTN({super.key, required this.cText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsConstant.primary_Color,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(
          child: CTextWidget(
            cText: cText,
            cTextStyle: TextStyle(
              color: ColorsConstant.white_Color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
