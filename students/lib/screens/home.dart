// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/screens/createOrEditStudentPage.dart';
import 'package:students/screens/search_screen.dart';
import 'package:students/utils/student_controller.dart';
import 'package:students/widgets/grid_view.dart';
import 'package:students/widgets/list_view.dart';

class Home extends StatelessWidget {
  Home({super.key});
  StudentController controller = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () => Get.to(
                () => const SearchScreen(),
                transition: Transition.size,
                duration: const Duration(milliseconds: 500),
              )?.then(
                (value) {
                  controller.updateStudents();
                },
              ),
              icon: const Icon(
                Icons.search,
                size: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(10),
            ),
            tabs: const [
              Tab(
                icon: SizedBox(
                  width: double.infinity,
                  child: Icon(Icons.grid_view_rounded),
                ),
              ),
              Tab(
                icon: SizedBox(
                  width: double.infinity,
                  child: Icon(Icons.view_list_rounded),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CustomGridView(),
            CustomListView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              () => CreateOrEditStudents(),
              transition: Transition.size,
              duration: const Duration(milliseconds: 500),
            );
          },
          foregroundColor: Colors.white,
          backgroundColor: Colors.white.withOpacity(0.3),
          highlightElevation: 20.0,
          shape: const CircleBorder(eccentricity: 0.5),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
