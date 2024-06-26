import 'package:expense_app/domain/ui_helper/ui_helper.dart';
import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/domain/utils/app_images.dart';
import 'package:expense_app/domain/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  var mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 345,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 41),
                    InkWell(
                      onTap: () {},
                      child: const SizedBox(
                        width: 38,
                        height: 38,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(Icons.keyboard_backspace_rounded)),
                      ),
                    ),
                    CTextWidget(
                      cText: 'Register',
                      cTextStyle: TextStyle(
                        color: ColorsConstant.primary_Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    CTextWidget(
                      cText:
                      'We have sent an email to your email\naccount with a verification code!',
                      cTextStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 21),
                  ],
                ),
              ),
              TextFieldWidget(
                hintStyle: TextStyle(
                  color: ColorsConstant.mainText_Color,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
                fillColor: ColorsConstant.white_Color,
                controller: mailController,
                hintText: 'Ex: 123456789',
                headTitle: 'Verification Code',
              ),
          
              const SizedBox(height: 21),
              ElevatedBTN(
                cText: 'Register', onTap: () {  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
