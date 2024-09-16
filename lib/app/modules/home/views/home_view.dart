import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levon/app/modules/home/views/novel_list.dart';
import 'package:levon/app/routes/app_pages.dart';
import '../../register/controllers/register_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserService userService = Get.find<UserService>();
    final user = userService.getUser();

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/eclipses.png'),
                    alignment: Alignment.topLeft,
                    fit: BoxFit.none,
                  ),
                  color: Color(0xFF3F6184),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              user != null ? '${user.firstName}' : 'User',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PROFILE);
                          },
                          child: Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                            size: 40.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 170.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Novels',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 30.sp,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(child: NovelList()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
