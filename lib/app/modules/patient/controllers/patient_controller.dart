import 'package:get/get.dart';
import 'package:nurse_call_demo/app/models/data_model.dart';
import 'package:nurse_call_demo/app/src/sqflight.dart';

class PatientController extends GetxController {
  List<DataModel> datas = [];
  List<DataModel> active = [];
  List<DataModel> recent = [];
  bool fetching = true;
  int currentIndex = 0;

  DB db = DB();
  @override
  void onInit() {
    getData2();
    super.onInit();
  }

  void getData2() async {
    datas = await db.getData();
    fetching = false;
    for (var data in datas) {
      if (data.isCompleted == 0) {
        active.add(data);
      } else {
        recent.add(data);
      }
    }

    update();
  }
}
