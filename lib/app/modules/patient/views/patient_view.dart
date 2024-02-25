import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nurse_call_demo/app/models/data_model.dart';

import '../controllers/patient_controller.dart';

class PatientView extends GetView<PatientController> {
  const PatientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientController>(
      assignId: true,
      init: PatientController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('PatientView'),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  DataModel dataLocal =
                      DataModel(title: "call${controller.datas.isEmpty ? 1 : controller.datas.length + 1}", isCompleted: 0, date: DateTime.now().toString());
                  controller.db.insertData(dataLocal);
                  dataLocal.id = controller.datas.isEmpty ? 1 : controller.datas.length + 1;

                  controller.datas.add(dataLocal);
                  controller.active.add(dataLocal);
                  controller.update();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.add),
                ),
              )
            ],
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
                            child: Row(
                              children: [
                                Text("${index + 1}"),
                                const Spacer(),
                                Text(controller.active[index].title),
                                const Spacer(),
                                Text(controller.active[index].date.toString()),
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
