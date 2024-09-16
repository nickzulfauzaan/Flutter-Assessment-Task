import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/api_services.dart';
import '../controllers/verification_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final String identifier = args['identifier'];
    final String otp = args['otp'];

    final VerificationController controller = Get.put(
      VerificationController(Get.find<ApiService>(), identifier, otp),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 17.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Verification',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp),
                ),
                SizedBox(height: 10.h),
                Text(
                  'We have sent a message to your phone number with an OTP code!',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 35.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verification Code",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 343.w,
                      height: 56.h,
                      child: TextField(
                        controller: controller.codeController,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.security, color: Color(0xFFC8C8C8)),
                          hintText: 'Enter the code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Color(0xFFC8C8C8), width: 1.5.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Color(0xFFC8C8C8), width: 1.5.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Obx(() => controller.isLoading.value
                        ? CircularProgressIndicator()
                        : SizedBox(
                            width: 343.w,
                            height: 56.h,
                            child: ElevatedButton(
                              onPressed: controller.validateOtp,
                              child: Text(
                                'Verify',
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
                          )),
                    Obx(() => controller.errorMessage.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              controller.errorMessage.value,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : Container()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
