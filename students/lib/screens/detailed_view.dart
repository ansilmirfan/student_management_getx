// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:students/model/student_model.dart';
import 'package:students/widgets/details_key_value.dart';

class DetailedView extends StatelessWidget {
  StudentModel data;
  DetailedView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 4 / 2,
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      width: size.width - 60,
                      height: size.height * 2 / 3,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: size.height / 15,
                          ),
                          Text(
                            data.name,
                            style: const TextStyle(fontSize: 25),
                          ),
                          DetailsWidget(
                            keys: 'Age',
                            value: data.age,
                          ),
                          DetailsWidget(
                            keys: 'Email',
                            value: data.email,
                          ),
                          DetailsWidget(
                            keys: 'Parent Name',
                            value: data.parentName,
                          ),
                          DetailsWidget(
                            keys: 'Contact No',
                            value: data.contactNumber,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: data.imagePath == null
                    ? CircleAvatar(
                        radius: size.height / 4 / 2,
                        child: Icon(
                          Icons.person,
                          size: size.height / 4 / 2,
                          color: Colors.black,
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage: AssetImage(data.imagePath!),
                        radius: size.height / 4 / 2,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
