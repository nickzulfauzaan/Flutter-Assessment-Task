import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/services/api_services.dart';
import '../../register/controllers/register_controller.dart';
import '../../verification/views/verification_view.dart';

class LoginController extends GetxController {
  final ApiService apiService;
  final emailController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  LoginController(this.apiService);

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter an email address.',
          snackPosition: SnackPosition.TOP);
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email address.',
          snackPosition: SnackPosition.TOP);
      return;
    }

    try {
      isLoading(true);
      errorMessage.value = '';

      final response = await apiService.postLogin(email);

      if (response.containsKey('user') && response.containsKey('otp')) {
        final userResponse = response['user'];
        String firstName = userResponse['firstName'] ?? '';
        String lastName = userResponse['lastName'] ?? '';
        String phoneNumber = userResponse['phoneNumber'] ?? '';

        final user = User(
          firstName: firstName,
          lastName: lastName,
          email: email,
        );

        final UserService userService = Get.find<UserService>();
        userService.setUser(user);

        Get.to(() => VerificationView(), arguments: {
          'identifier': email,
          'phoneNumber': phoneNumber,
          'otp': response['otp'],
        });
      } else {
        errorMessage.value =
            'Login failed. Please check your email and try again.';
      }
    } catch (e) {
      print('Login error: $e');
      errorMessage.value =
          'Login failed. Please check your email and try again.';
    } finally {
      isLoading(false);
    }
  }
}
