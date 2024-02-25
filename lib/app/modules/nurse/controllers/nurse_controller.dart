import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nurse_call_demo/app/models/data_model.dart';
import 'package:nurse_call_demo/app/src/sqflight.dart';

class NurseController extends GetxController {
  final player = AudioPlayer();
  List<DataModel> datas = [];
  List<DataModel> active = [];
  List<DataModel> recent = [];
  bool fetching = true;
  int currentIndex = 0;
  String urlName = "https://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3";
  DB db = DB();
  @override
  void onInit() {
    player.setAudioSource(AudioSource.uri(Uri.parse(urlName)));
    getData2();
    super.onInit();
  }

  void getData2() async {
    datas = await db.getData();
    fetching = false;
    for (var data in datas) {
      print("data=-=-=-=-=-=-=-=-=-=-=-=->>${data.isCompleted}");
      if (data.isCompleted == 0) {
        active.add(data);
      } else {
        recent.add(data);
      }
    }
    if (active.isNotEmpty) {
      player.play();
      update();
    } else {
      update();
    }
  }

  @override
  void onClose() {
    player.stop();
    if (!isClosed) {
      player.dispose();
    }
    super.onClose();
  }
}
