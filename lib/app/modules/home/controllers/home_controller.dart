import 'package:get/get.dart';
import 'api_controller.dart';

class HomeController extends GetxController {
  final ApiController apiController;
  var novels = <Map<String, dynamic>>[].obs;
  var filteredNovels = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var searchQuery = ''.obs;

  HomeController({required this.apiController});

  @override
  void onInit() {
    fetchNovels();
    super.onInit();
  }

  Future<void> fetchNovels() async {
    try {
      isLoading(true);
      final fetchedNovels = await apiController.fetchNovels();
      novels.assignAll(fetchedNovels.cast<Map<String, dynamic>>());
      filteredNovels.assignAll(novels);
    } catch (e) {
      errorMessage('An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchNovels(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredNovels.assignAll(novels);
    } else {
      filteredNovels.assignAll(
        novels.where(
          (novel) => novel['title'].toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  Future<void> refreshNovels() async {
    await fetchNovels();
  }
}
