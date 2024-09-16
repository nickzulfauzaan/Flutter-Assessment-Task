import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levon/app/modules/welcome/views/create_account.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:levon/app/routes/app_pages.dart'; // Import flutter_screenutil

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onboardingBackground.png'),
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height / 2 - 335)
                .h, // Make height responsive
            left: (MediaQuery.of(context).size.width / 2 - 170)
                .w, // Make width responsive
            child: Image.asset(
              'assets/manga.gif',
              width: 350.w, // Make width responsive
              height: 400.h, // Make height responsive
            ),
          ),
          Positioned(
            bottom: 30.h, // Responsive bottom padding
            left: 20.w, // Responsive left padding
            right: 20.w, // Responsive right padding
            child: CreateAccount(
              onCreateAccountPressed: () {
                // Handle create account button press
                Get.toNamed(Routes.REGISTER);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => RegisterView()),
                // );
              },
              onLoginPressed: () {
                // Handle login button press
                Get.toNamed(Routes.LOGIN);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LoginView()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
