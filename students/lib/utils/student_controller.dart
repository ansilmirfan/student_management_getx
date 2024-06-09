// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:students/model/student_model.dart';

class StudentController extends GetxController {
  List<StudentModel> studentList = <StudentModel>[].obs;

  late Box studentBox;
  @override
  void onInit() {
    openStudentBox();
    updateStudents();
    super.onInit();
  }

  Future<void> openStudentBox() async {
    studentBox = await Hive.openBox<StudentModel>('Student_db');
  }

  Future<void> addStudentData(StudentModel data) async {
    try {
      await openStudentBox();
      data.id = await studentBox.add(data);
      studentBox.put(data.id, data);
      studentList.add(data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateStudents() async {
    await openStudentBox();
    studentList.clear();
    studentList.addAll(List.from(studentBox.values));
    update();
  }

  Future<void> deleteStudent(int id) async {
    await openStudentBox();
    studentBox.delete(id);
    updateStudents();
  }

  Future<void> editStudent(StudentModel data) async {
    await openStudentBox();
    studentBox.put(data.id, data);
    updateStudents();
  }

  Future<void> searchStudents(String query) async {
    await openStudentBox();
    studentList.clear();
    studentList.addAll(
      List.from(
        studentBox.values.where(
          (e) => e.name.toLowerCase().contains(query.toLowerCase()),
        ),
      ),
    );
  }

  StudentModel getOneStudent(int id) {
    return studentList.firstWhere((e) => e.id == id);
  }
}
