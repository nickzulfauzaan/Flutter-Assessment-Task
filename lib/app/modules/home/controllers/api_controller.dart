import 'package:get/get.dart';
import '../../../data/services/api_services.dart';

class ApiController extends GetxService {
  final ApiService apiService;

  ApiController(this.apiService);

  Future<List<dynamic>> fetchNovels() async {
    try {
      final response =
          await apiService.get('fetchNovel'); // Call the generic GET method
      if (response['data'] is List) {
        return response['data'];
      } else {
        throw Exception(
            'Failed to load data - Data field missing or not a list');
      }
    } catch (e) {
      throw Exception('Failed to fetch novels: $e');
    }
  }
}
