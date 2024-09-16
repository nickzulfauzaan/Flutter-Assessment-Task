import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:levon/app/data/services/api_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  final RegisterController controller =
      Get.put(RegisterController(Get.find<ApiService>()));

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.only(left: 15.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Create an account to access all the novels of your choice!',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                // Email
                _buildTextField(
                  label: 'Email',
                  controller: controller.emailController,
                  icon: Icons.email_rounded,
                ),
                SizedBox(height: 10.h),
                // First Name
                _buildTextField(
                  label: 'First Name',
                  controller: controller.firstNameController,
                  icon: Icons.person,
                ),
                SizedBox(height: 10.h),
                // Last Name
                _buildTextField(
                  label: 'Last Name',
                  controller: controller.lastNameController,
                  icon: Icons.person,
                ),
                SizedBox(height: 10.h),
                // Gender
                Text(
                  'Gender',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(
                  width: 344.w,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide:
                            BorderSide(color: Color(0xFFC8C8C8), width: 1.5.w),
                      ),
                    ),
                    value: controller.selectedGender.value.isEmpty
                        ? null
                        : controller.selectedGender.value,
                    hint: Text("Select Gender"),
                    items: ['Male', 'Female'].map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedGender.value = value!;
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                // Country Code Dropdown
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.countryCodes.isEmpty) {
                    return Text('No country codes available');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        Container(
                          width: 344.w,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFC8C8C8), width: 1.5.w),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: SizedBox(),
                            value: controller.selectedCountryCode.value.isEmpty
                                ? null
                                : controller.selectedCountryCode.value,
                            hint: Text("Select Country"),
                            items: controller.countryCodes.map((country) {
                              return DropdownMenuItem<String>(
                                value: country['code'],
                                child: Text(
                                  '${country['flag']} ${country['name']} (${country['dialCode']})',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.selectedCountryCode.value = value!;
                            },
                          ),
                        ),
                      ],
                    );
                  }
                }),
                SizedBox(height: 10.h),

                _buildTextField(
                  label: 'Phone Number (with country code)',
                  controller: controller.phoneController,
                  icon: Icons.phone,
                ),
                SizedBox(height: 15.h),

                SizedBox(
                  width: 343.w,
                  height: 56.h,
                  child: Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.register,
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3F6184),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for creating TextFields
  Widget _buildTextField(
      {required String label,
      required TextEditingController controller,
      required IconData icon,
      bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16.sp)),
        SizedBox(
          width: 343.w,
          height: 56.h,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Color(0xFFC8C8C8)),
              hintText: 'Enter your $label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r), // Responsive radius
                borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.5.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1.5.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
