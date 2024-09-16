import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/services/api_services.dart';
import '../controllers/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String identifier = args['identifier'] ?? '';
    final String otp = args['otp'] ?? '';

    if (identifier.isEmpty || otp.isEmpty) {
      print('Warning: Missing required arguments for VerificationBinding');
      return;
    }

    Get.lazyPut<VerificationController>(
      () => VerificationController(
        ApiService(http.Client()),
        identifier,
        otp,
      ),
    );
  }
}
