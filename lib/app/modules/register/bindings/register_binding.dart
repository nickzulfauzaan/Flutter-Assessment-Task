import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/services/api_services.dart';
import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // Instantiate ApiService with a http.Client instance
    final apiService = ApiService(http.Client());

    // Pass the ApiService instance to RegisterController
    Get.lazyPut<RegisterController>(
      () => RegisterController(apiService),
    );
  }
}
