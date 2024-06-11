// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field, non_constant_identifier_names, must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/model/student_model.dart';
import 'package:students/utils/student_controller.dart';
import 'package:students/utils/validation.dart';
import 'package:students/widgets/custom_textfield.dart';
import 'package:students/widgets/cutom_textbutton.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrEditStudents extends StatefulWidget {
  bool edit;
  StudentModel? data;
  CreateOrEditStudents({super.key, this.edit = false, this.data});

  @override
  State<CreateOrEditStudents> createState() => _CreateOrEditStudentsState();
}

class _CreateOrEditStudentsState extends State<CreateOrEditStudents> {
  File? _Imagepaths;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  String? path;
  final _formKey = GlobalKey<FormState>();
  final StudentController studentController = Get.find<StudentController>();
  @override
  void initState() {
    super.initState();
    if (widget.edit) {
      updateDataToTheField();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  path == null
                      ? const CircleAvatar(
                          radius: 60,
                          child: Icon(
                            Icons.person,
                            size: 45,
                          ),
                        )
                      : CircleAvatar(
                          radius: 60, backgroundImage:FileImage(File(path!))),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                      icon: const Icon(Icons.camera_alt),
                    ),
                  )
                ],
              ),
            ),
            CustomeTextfield(
              labelText: 'Name',
              controller: nameController,
              validator: Validation.validateName,
            ),
            CustomeTextfield(
              labelText: 'Age',
              controller: ageController,
              validator: Validation.validateAge,
              keyboardType: TextInputType.number,
            ),
            CustomeTextfield(
              labelText: 'Email',
              controller: emailController,
              validator: Validation.validateEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomeTextfield(
              labelText: 'Parent Name',
              controller: parentNameController,
              validator: Validation.validateName,
            ),
            CustomeTextfield(
              labelText: 'Contact Number',
              controller: contactNumberController,
              validator: Validation.validateContactNumber,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 60,
            ),
            CustomTextButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  updateData();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void updateDataToTheField() {
    setState(() {
      path = widget.data?.imagePath;
      nameController.text = widget.data!.name;
      ageController.text = widget.data!.age;
      emailController.text = widget.data!.email;
      parentNameController.text = widget.data!.parentName;
      contactNumberController.text = widget.data!.contactNumber;
    });
  }

  _pickImageFromGallery() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_image != null) {
      setState(() {
        _Imagepaths = File(_image.path);
        path = _Imagepaths!.path;
      });
    }
  }

  updateData() async {
    var data = StudentModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      contactNumber: contactNumberController.text.trim(),
      age: ageController.text.trim(),
      parentName: parentNameController.text.trim(),
      imagePath: path,
    );
    var edited = StudentModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        contactNumber: contactNumberController.text.trim(),
        age: ageController.text.trim(),
        parentName: parentNameController.text.trim(),
        imagePath: path,
        id: widget.data?.id);
    widget.edit
        ? await studentController.editStudent(edited)
        : await studentController.addStudentData(data);
    Get.back();
  }
}
