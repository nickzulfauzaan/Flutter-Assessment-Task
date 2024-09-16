import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:levon/app/modules/home/views/home_view.dart';
import '../../../data/services/api_services.dart';

class VerificationController extends GetxController {
  final ApiService apiService;
  final TextEditingController codeController = TextEditingController();
  final String identifier;
  final String expectedOtp;

  VerificationController(this.apiService, this.identifier, this.expectedOtp);

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }

  Future<void> validateOtp() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // First, check if the entered OTP matches the expected OTP
      if (codeController.text == expectedOtp) {
        // If it matches, call the API to validate
        final response =
            await apiService.validateOtp(identifier, codeController.text);

        // Check if validation is successful
        if (response.containsKey('user')) {
          // If the response contains user data, OTP validation is successful
          Get.offAll(() => HomeView());
        } else {
          errorMessage.value = 'Invalid OTP. Please try again.';
        }
      } else {
        errorMessage.value = 'Incorrect OTP. Please try again.';
      }
    } catch (e) {
      errorMessage.value = 'Failed to validate OTP: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
