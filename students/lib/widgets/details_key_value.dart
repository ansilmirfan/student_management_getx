// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  String keys;
  String value;
  DetailsWidget({super.key, required this.keys, required this.value});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Align(alignment: Alignment.topLeft, child: Text(keys)),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: 40,
          width: size.width * 7 / 10,
          child: Text(
            value,
            
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
