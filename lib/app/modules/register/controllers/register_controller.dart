import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:levon/app/routes/app_pages.dart';
import '../../../data/services/api_services.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;

  User({required this.firstName, required this.lastName, required this.email});
}

class UserService extends GetxService {
  static UserService get to => Get.find();
  Rx<User?> currentUser = Rx<User?>(null);

  void setUser(User user) {
    currentUser.value = user;
  }

  User? getUser() {
    return currentUser.value;
  }
}

class RegisterController extends GetxController {
  final ApiService apiService;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  var selectedGender = ''.obs;
  var selectedCountryCode = ''.obs;
  var selectedDialCode = ''.obs;
  var isLoading = false.obs;

  var countryCodes = <Map<String, dynamic>>[].obs;

  RegisterController(this.apiService);

  @override
  void onInit() {
    super.onInit();
    fetchCountryCodes();
  }

  void fetchCountryCodes() async {
    try {
      isLoading(true);
      final codes = await apiService.getCountryCodes();
      final codesAsMaps = codes.map((country) => country.toJson()).toList();
      countryCodes.assignAll(codesAsMaps);
    } catch (e) {
      print('Error fetching country codes: $e');
    } finally {
      isLoading(false);
    }
  }

  void register() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String countryCode = selectedCountryCode.value.trim();
    String dialCode = selectedDialCode.value.trim();
    String phone = phoneController.text.trim();
    String gender = selectedGender.value;

    String fullPhoneNumber = '$dialCode$phone';

    if ([email, firstName, lastName, countryCode, fullPhoneNumber, gender]
            .contains('') ||
        gender.isEmpty) {
      Get.snackbar('Error', 'All fields are required.',
          snackPosition: SnackPosition.TOP);
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Invalid email format.',
          snackPosition: SnackPosition.TOP);
      return;
    }

    try {
      isLoading(true);

      final requestData = {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'countryCode': countryCode,
        'phoneNumber': fullPhoneNumber,
      };

      print('Sending registration data: $requestData');

      final response = await apiService.post('register', requestData);

      if (response.containsKey('error')) {
        Get.snackbar('Error', response['error']['message'],
            snackPosition: SnackPosition.TOP);
      } else {
        UserService.to.setUser(User(
          firstName: firstName,
          lastName: lastName,
          email: email,
        ));
        Get.snackbar('Success', 'Registered successfully!',
            snackPosition: SnackPosition.TOP);
        Get.toNamed(
          Routes.VERIFICATION,
          arguments: {
            'identifier': email,
            'otp': response['otp'],
          },
        );
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Registration failed. Please try again.',
          snackPosition: SnackPosition.TOP);
    } finally {
      isLoading(false);
    }
  }
}
