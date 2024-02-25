import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nurse_call_demo/app/models/data_model.dart';

import '../controllers/nurse_controller.dart';

class NurseView extends GetView<NurseController> {
  const NurseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NurseController>(
      assignId: true,
      init: NurseController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Nurse View'),
            centerTitle: true,
            leading: GestureDetector(
                onTap: () async {
                  await controller.player.stop();
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
          ),
          body: ListView(
            children: [
              controller.active.isEmpty
                  ? Container()
                  : Container(
                      color: Colors.green.shade500,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text("Active"),
                    ),
              controller.active.isEmpty
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.active.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                            color: Colors.blue.shade100,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("${index + 1}"),
                                    const Spacer(),
                                    Text(controller.active[index].title),
                                    const Spacer(),
                                    Text(controller.active[index].date.toString()),
                                  ],
                                ),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () async {
                                    controller.db.update(
                                        DataModel(
                                            id: controller.active[index].id,
                                            title: controller.active[index].title,
                                            isCompleted: 1,
                                            date: controller.active[index].date),
                                        controller.active[index].id!);
                                    controller.recent.add(controller.active[index]);
                                    controller.active.removeAt(index);
                                    if (controller.active.isEmpty) {
                                      await controller.player.stop();
                                    }
                                    controller.update();
                                  },
                                  child: Container(
                                    color: Colors.red.shade300,
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: double.infinity,
                                    child: Text("Dismiss"),
                                  ),
                                ),
                              ],
                            ));
                      },
                    ),
              controller.recent.isEmpty
                  ? Container()
                  : Container(
                      color: Colors.grey.shade500,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text("Recent"),
                    ),
              controller.recent.isEmpty
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.recent.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                            color: Colors.blue.shade100,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text("${index + 1}"),
                                const Spacer(),
                                Text(controller.recent[index].title),
                                const Spacer(),
                                Text(controller.recent[index].date.toString()),
                              ],
                            ));
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
