import 'package:get/get.dart';

class DetailController extends GetxController {
  final novel = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    super.onInit();
    novel.value = Get.arguments ?? {};
  }
}
