import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/utils/student_controller.dart';

StudentController controller = Get.find<StudentController>();

customAlertDialog(int id) {
  Get.dialog(
    AlertDialog(
      title: const Text('Delete'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete this item?',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            controller.deleteStudent(id);
            Get.back();
          },
          child: const Text('OK'),
        ),
      ],
    ),
    transitionCurve: Curves.slowMiddle,
    transitionDuration: const Duration(milliseconds: 250),
  );
}

void showSnackbar(
  String title,
  String message,
) {
  Get.snackbar(
    title,
    message,
    colorText: Colors.white,
    backgroundColor: Colors.white30,
    snackPosition: SnackPosition.BOTTOM,
    forwardAnimationCurve: Curves.elasticInOut,
    reverseAnimationCurve: Curves.easeOut,
  );
}
