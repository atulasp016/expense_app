import 'package:expense_app/data/repository/local/database_helper.dart';
import 'package:expense_app/domain/routes/app_routes.dart';
import 'package:expense_app/domain/ui_helper/ui_helper.dart';
import 'package:expense_app/domain/utils/app_colors.dart';
import 'package:expense_app/domain/utils/app_images.dart';
import 'package:expense_app/domain/widgets/button_widgets.dart';
import 'package:expense_app/presentation/pages/onborad/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSignIN();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
/*
                color: const Color.fromRGBO(202, 82, 222, 100.0),
*/
                image: DecorationImage(
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    image: AssetImage(ImageConstant.splash_logo)),
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(41)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CTextWidget(
                        cText: 'EXPENIO',
                        cTextStyle: TextStyle(
                          color: ColorsConstant.secondaryblack_Color,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 2.5,
                          fontSize: 42,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(
                          'Going cashless has never been this easier with the world’s most leading expense manager.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsConstant.secondaryblack_Color,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.5,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedBTN(
                    cText: 'Get Started',
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.SIGNIN_PAGE);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void checkSignIN() async {
    var pref = await SharedPreferences.getInstance();
    var signin = pref.getInt(AppDatabase.PRIMARY_KEY);
    if (signin != null) {
      if (signin > 0) {
        Navigator.pushReplacementNamed(context, AppRoutes.HOME_BNB_PAGE);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.SIGNIN_PAGE);
      }
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.SIGNIN_PAGE);
    }
  }

  void checkSignOut() async {
    var pref = await SharedPreferences.getInstance();
    var signOut = await pref.setBool(AppDatabase.SIGNOUT_KEY, true);
    if (signOut) {
      Navigator.pushReplacementNamed(context, AppRoutes.HOME_BNB_PAGE);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.SIGNIN_PAGE);
    }
  }
}
