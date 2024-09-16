import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/api_services.dart';
import '../controllers/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  final LoginController controller =
      Get.put(LoginController(Get.find<ApiService>()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Enter your email address to login.',
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity.w,
              height: 56.h,
              child: Obx(() => ElevatedButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.login,
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F6184),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )),
            ),
            Obx(() {
              if (controller.errorMessage.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    controller.errorMessage.value,
                    style: TextStyle(color: Colors.red, fontSize: 16.sp),
                  ),
                );
              } else {
                return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
