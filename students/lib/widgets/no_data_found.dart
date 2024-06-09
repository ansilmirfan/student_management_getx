// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  bool search;
  NoDataFound({super.key, this.search = false});
  String nodataSearch =
      "Sorry, we couldn't find any results. Please try again with different keywords.";
  String nodataFound =
      "No entries found. Click the ' + ' icon to add a new entry.";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          !search ? nodataFound : nodataSearch,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
