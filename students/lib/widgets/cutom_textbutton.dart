import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  void Function()? onTap;
   CustomTextButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ),
          child: const Text('Save'),
        ),
      ),
    );
  }
}
