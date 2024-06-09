import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? imagePath;
  @HiveField(3)
  String email;
  @HiveField(4)
  String contactNumber;
  @HiveField(5)
  String age;
  @HiveField(6)
  String parentName;

  StudentModel({
    this.id,
    required this.name,
    this.imagePath,
    required this.email,
    required this.contactNumber,
    required this.age,
    required this.parentName,
  });
}
