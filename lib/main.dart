import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/modules/register/controllers/register_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/modules/home/bindings/home_binding.dart';

void main() {
  Get.put(UserService());
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: HomeBinding(),
        );
      },
    ),
  );
}
