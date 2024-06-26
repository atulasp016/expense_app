import 'package:expense_app/domain/routes/app_routes.dart';
import 'package:expense_app/domain/ui_helper/ui_helper.dart';
import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/domain/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 345,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CTextWidget(
                    cText: 'Welcome to',
                    cTextStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                  CTextWidget(
                    cText: 'Expenio',
                    cTextStyle: TextStyle(
                      color: ColorsConstant.primary_Color,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  CTextWidget(
                    cText:
                        'A place where you can track all your\nexpenses and incomes...',
                    cTextStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 41),
                  CTextWidget(
                    cText: 'Let’s Get Started...',
                    cTextStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 17.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),
            OutlineGoogleBTN(onTap: () {}),
            const SizedBox(height: 21),
            OutlineEmailBTN(onTap: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CTextWidget(
                    cText: 'Already have an account?',
                    cTextStyle: TextStyle(
                      color: ColorsConstant.black_Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRoutes.SIGNIN_PAGE);
                    },
                    child: CTextWidget(
                      cText: '\tLogin',
                      cTextStyle: TextStyle(
                        color: ColorsConstant.primary_Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
