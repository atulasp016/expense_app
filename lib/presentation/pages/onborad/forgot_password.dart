import 'package:expense_app/domain/ui_helper/ui_helper.dart';
import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/domain/utils/app_images.dart';
import 'package:expense_app/domain/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                      cText: 'Forgot Password?',
                      cTextStyle: TextStyle(
                        color: ColorsConstant.primary_Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    CTextWidget(
                      cText:
                      'Recover you password if you\nhave forgot the password!',
                      cTextStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 21),
                  ],
                ),
              ),
              CustomTextField(
                hintStyle: TextStyle(
                  color: ColorsConstant.mainText_Color,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
                prefixIconImage: ImageConstant.ic_mail,
                fillColor: ColorsConstant.white_Color,
                keyType: TextInputType.emailAddress,
                controller: mailController,
                headTitle: 'Email',
                hintText: 'Ex: abc@example.com',
              ),

              const SizedBox(height: 21),
              ElevatedBTN(
                  cText: 'Submit', onTap: () {  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
