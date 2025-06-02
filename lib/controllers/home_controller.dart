import 'package:survey/repositories/local/record_repository.dart';
import 'package:survey/services/user_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxMap counts = <String, int>{}.obs;
  final RecordRepository recordRepository = RecordRepository();
  RxString name = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCounts();
   populateData();
  }

  void populateData() async{
    UserService userService = UserService();
    Map<String, dynamic> userData = await userService.getUserData();
    name.value = userData['first_name'];
  }

  void _loadCounts() async {
    var countData = await recordRepository.getCounts();
    counts.assignAll(countData);
  }

  Future<void> refreshCounts() async{
    var countData = await recordRepository.getCounts();
    counts.assignAll(countData);
  }
}
