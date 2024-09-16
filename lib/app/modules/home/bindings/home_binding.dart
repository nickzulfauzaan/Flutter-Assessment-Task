import 'package:get/get.dart';
import '../../../data/services/api_services.dart';
import '../controllers/api_controller.dart';
import '../controllers/home_controller.dart';
import 'package:http/http.dart' as http;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Register the ApiService with http.Client
    Get.put(ApiService(http.Client()));

    // Register the ApiController with the required ApiService
    Get.put(ApiController(Get.find<ApiService>()));

    // Register the HomeController with the required ApiController
    Get.put(HomeController(apiController: Get.find<ApiController>()));
  }
}
