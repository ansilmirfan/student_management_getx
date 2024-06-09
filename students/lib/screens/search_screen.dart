// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/utils/student_controller.dart';
import 'package:students/widgets/list_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.find<StudentController>();
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          onChanged: (value) {
            controller.searchStudents(value);
          },
        ),
        foregroundColor: Colors.white,
      ),
      body: CustomListView(
        search: true,
      ),
    );
  }
}
