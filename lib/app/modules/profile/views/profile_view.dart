import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:levon/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import '../../register/controllers/register_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserService userService = Get.find<UserService>();
    final user = userService.getUser();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 220.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 570.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.r),
                bottomRight: Radius.circular(50.r),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/eclipses.png'),
                    alignment: Alignment.topLeft,
                    fit: BoxFit.none,
                  ),
                  color: Color(0xFF3F6184),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 115.w),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        iconSize: 24.w,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2.r,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Color(0xFF3F6184),
                      size: 60.sp,
                    ),
                  ),
                ),
                Text(
                  user != null ? '${user.firstName}' : 'User',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  user != null ? '${user.email}' : 'User',
                  style: TextStyle(
                    color: Color(0xFF3F6184),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.group_add,
                          color: Color(0xFF3F6184),
                          size: 30.w,
                        ),
                        title: Text(
                          'Invite friends',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Color(0xFF3F6184),
                          size: 30.w,
                        ),
                        title: Text(
                          'Account info',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Color(0xFF3F6184),
                          size: 30.w,
                        ),
                        title: Text(
                          'Personal profile',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.security,
                          color: Color(0xFF3F6184),
                          size: 30.w,
                        ),
                        title: Text(
                          'Login and security',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.lock,
                          color: Color(0xFF3F6184),
                          size: 30.w,
                        ),
                        title: Text(
                          'Data and privacy',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        width: 150.w,
                        height: 54.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.WELCOME);
                          },
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3F6184),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
