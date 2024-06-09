// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/model/student_model.dart';
import 'package:students/screens/createOrEditStudentPage.dart';
import 'package:students/screens/detailed_view.dart';
import 'package:students/utils/student_controller.dart';
import 'package:students/widgets/alert_dialog.dart';
import 'package:students/widgets/no_data_found.dart';

class CustomListView extends StatelessWidget {
  bool search;
  final Function(String?)? onSearch;
  CustomListView({super.key, this.search = false, this.onSearch});

  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.find<StudentController>();

    return Obx(
      () => controller.studentList.isEmpty
          ? NoDataFound(
              search: search,
            )
          : ListView.builder(
              itemCount: controller.studentList.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                StudentModel data = controller.studentList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Get.to(
                      () => DetailedView(data: data),
                      transition: Transition.size,
                      duration: const Duration(milliseconds: 500),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: data.imagePath == null
                            ? const CircleAvatar(
                                child: Icon(Icons.person),
                              )
                            : CircleAvatar(
                                backgroundImage: AssetImage(data.imagePath!),
                              ),
                        title: Text(
                          data.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                customAlertDialog(data.id!);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white60,
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
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
