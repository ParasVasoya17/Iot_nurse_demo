import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nurse_call_demo/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      assignId: true,
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('LoginView'),
            centerTitle: true,
          ),
          body: Center(
              child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PATIENT);
                  },
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    child: Text("Patient"),
                  ),
                ),
                SizedBox(height: 100),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.NURSE);
                  },
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    child: Text("Nurse"),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
