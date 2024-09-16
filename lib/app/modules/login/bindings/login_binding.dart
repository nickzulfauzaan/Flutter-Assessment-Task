import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:levon/app/modules/login/controllers/login_controller.dart';
import '../../../data/services/api_services.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Instantiate ApiService with a http.Client instance
    final apiService = ApiService(http.Client());

    // Pass the ApiService instance to RegisterController
    Get.lazyPut<LoginController>(
      () => LoginController(apiService),
    );
  }
}
