import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/model/student_model.dart';
import 'package:students/screens/createOrEditStudentPage.dart';
import 'package:students/screens/detailed_view.dart';
import 'package:students/utils/student_controller.dart';
import 'package:students/widgets/alert_dialog.dart';
import 'package:students/widgets/no_data_found.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});
  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.find<StudentController>();
    return Obx(
      () => controller.studentList.isEmpty
          ? NoDataFound()
          : GridView.builder(
              itemCount: controller.studentList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 5.5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                StudentModel data = controller.studentList[index];
                return InkWell(
                  onTap: () {
                    Get.to(
                        () => DetailedView(
                              data: data,
                            ),
                        transition: Transition.size,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        data.imagePath == null
                            ? const CircleAvatar(
                                radius: 40.0,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    FileImage(File(data.imagePath!)),
                                radius: 40,
                              ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            data.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                customAlertDialog(data.id!);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white38,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.to(
                                    () => CreateOrEditStudents(
                                          edit: true,
                                          data: data,
                                        ),
                                    transition: Transition.size,
                                    duration:
                                        const Duration(milliseconds: 500));
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white38,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
